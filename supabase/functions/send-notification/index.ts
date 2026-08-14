import "@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { JWT } from "npm:google-auth-library@9";

// This function sends a notification to all registered devices of a user.
Deno.serve(async (req) => {
  try {
    const { user_id, device_id, data } = await req.json();

    console.log(`[send-notification] Received request - user_id: ${user_id}, device_id: ${device_id}`);

    if (!user_id || !device_id) {
      return new Response(
        JSON.stringify({ error: "user_id and device_id are required" }),
        { headers: { "Content-Type": "application/json" }, status: 400 },
      );
    }

    const supabaseAdmin = createClient(
      Deno.env.get("SUPABASE_URL") ?? "",
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
    );

    // Get FCM token for the specific user and device
    const { data: tokens, error: tokenError } = await supabaseAdmin
      .from("fcm_tokens")
      .select("fcm_token, device_name")
      .eq("user_id", user_id)
      .eq("device_id", device_id);

    if (tokenError) {
      return new Response(JSON.stringify({ error: tokenError.message }), {
        headers: { "Content-Type": "application/json" },
        status: 500,
      });
    }

    if (!tokens || tokens.length === 0) {
      return new Response(
        JSON.stringify({ message: "No tokens found for user" }),
        { headers: { "Content-Type": "application/json" }, status: 200 },
      );
    }

    console.log(`Sending wakeup call to user ${user_id}`);
    console.log(`Tokens: ${tokens.map((t) => `${t.fcm_token} (${t.device_name || "unknown"})`).join(", ")}`);

    const serviceAccountKeyStr = Deno.env.get("FIREBASE_SERVICE_ACCOUNT_KEY");
    if (!serviceAccountKeyStr) {
      return new Response(
        JSON.stringify({ error: "Server Configuration Error: FIREBASE_SERVICE_ACCOUNT_KEY is not set" }),
        { headers: { "Content-Type": "application/json" }, status: 500 },
      );
    }

    let serviceAccount;
    try {
      serviceAccount = JSON.parse(serviceAccountKeyStr);
    } catch (e) {
      return new Response(
        JSON.stringify({ error: "Server Configuration Error: FIREBASE_SERVICE_ACCOUNT_KEY is not valid JSON" }),
        { headers: { "Content-Type": "application/json" }, status: 500 },
      );
    }

    const projectId = serviceAccount.project_id;
    if (!projectId) {
      return new Response(
        JSON.stringify({ error: "Server Configuration Error: FIREBASE_SERVICE_ACCOUNT_KEY is missing project_id" }),
        { headers: { "Content-Type": "application/json" }, status: 500 },
      );
    }

    const jwtClient = new JWT({
      email: serviceAccount.client_email,
      key: serviceAccount.private_key,
      scopes: ["https://www.googleapis.com/auth/firebase.messaging"],
    });

    let accessToken;
    try {
      const jwtResponse = await jwtClient.getAccessToken();
      accessToken = jwtResponse.token;
    } catch (e) {
      return new Response(
        JSON.stringify({ error: `Failed to authenticate with Google: ${e instanceof Error ? e.message : String(e)}` }),
        { headers: { "Content-Type": "application/json" }, status: 500 },
      );
    }

    const fcmResponses = await Promise.all(
      tokens.map(async (token) => {
        const stringifiedData: Record<string, string> = {};
        if (data && typeof data === "object") {
          for (const [key, value] of Object.entries(data)) {
            stringifiedData[key] = typeof value === "object" ? JSON.stringify(value) : String(value);
          }
        }

        const res = await fetch(
          `https://fcm.googleapis.com/v1/projects/${projectId}/messages:send`,
          {
            method: "POST",
            headers: {
              Authorization: `Bearer ${accessToken}`,
              "Content-Type": "application/json",
            },
            body: JSON.stringify({
              message: {
                token: token.fcm_token,
                data: {
                  ...stringifiedData,
                  wakeup: "true",
                },
              },
            }),
          },
        );

        if (!res.ok) {
          const errorText = await res.text();
          console.error(`Failed to send to ${token.fcm_token}: ${res.status} ${errorText}`);
          return { success: false, error: errorText, token: token.fcm_token };
        }
        return { success: true, token: token.fcm_token };
      }),
    );

    const failedCount = fcmResponses.filter((r) => !r.success).length;

    return new Response(
      JSON.stringify({
        message: "Notification dispatch completed",
        total: tokens.length,
        successful: tokens.length - failedCount,
        failed: failedCount,
        details: fcmResponses,
      }),
      { headers: { "Content-Type": "application/json" }, status: failedCount === tokens.length ? 500 : 200 },
    );
  } catch (err) {
    return new Response(
      JSON.stringify({
        error: err instanceof Error ? err.message : "Unknown error occurred",
      }),
      { headers: { "Content-Type": "application/json" }, status: 500 },
    );
  }
});
