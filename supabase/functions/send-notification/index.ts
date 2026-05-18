import "@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

// This function sends a notification to all registered devices of a user.
Deno.serve(async (req) => {
  try {
    const { user_id, title, body, data } = await req.json();

    if (!user_id || !title || !body) {
      return new Response(
        JSON.stringify({ error: "user_id, title, and body are required" }),
        { headers: { "Content-Type": "application/json" }, status: 400 },
      );
    }

    const supabaseAdmin = createClient(
      Deno.env.get("SUPABASE_URL") ?? "",
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
    );

    // Get all FCM tokens for the user
    const { data: tokens, error: tokenError } = await supabaseAdmin
      .from("fcm_tokens")
      .select("fcm_token, device_name")
      .eq("user_id", user_id);

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

    // In a real implementation, you would use the Firebase Admin SDK or the HTTP v1 API.
    // For Deno, you can use a library like 'google-auth-library' to get an access token
    // and then call https://fcm.googleapis.com/v1/projects/{project_id}/messages:send
    
    // For now, we'll log the attempt. To fully implement this, you need to set up
    // Google Service Account credentials in your Supabase project.
    
    console.log(`Sending notification to user ${user_id}: ${title} - ${body}`);
    console.log(`Tokens: ${tokens.map(t => `${t.fcm_token} (${t.device_name || 'unknown'})`).join(', ')}`);

    // Placeholder for actual FCM call:
    /*
    const accessToken = await getAccessToken(); // Implement this with service account
    const projectId = Deno.env.get("FIREBASE_PROJECT_ID");
    
    for (const token of tokens) {
      await fetch(`https://fcm.googleapis.com/v1/projects/${projectId}/messages:send`, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${accessToken}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          message: {
            token: token.fcm_token,
            notification: { title, body },
            data: data || {},
          }
        })
      });
    }
    */

    return new Response(
      JSON.stringify({ message: "Notification dispatch initiated", count: tokens.length }),
      { headers: { "Content-Type": "application/json" }, status: 200 },
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
