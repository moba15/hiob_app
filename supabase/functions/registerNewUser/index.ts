import "@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import type { RegisterNewUserRequest, RegisterNewUserResponse } from "../_shared/types.ts";

// This function creates a new user in Supabase Auth using a password.
Deno.serve(async (req) => {
  try {
    const { password } = await req.json() as RegisterNewUserRequest;

    if (!password) {
      return new Response(
        JSON.stringify({ error: "Password is required" } satisfies RegisterNewUserResponse),
        { headers: { "Content-Type": "application/json" }, status: 400 },
      );
    }

    while (true) {
      // Generate a unique UUID for the user
      const uuid = crypto.randomUUID();

      // Supabase Auth natively requires an email or phone for password-based accounts.
      // Since we only have a password, we generate a synthetic email using the generated UUID.
      const syntheticEmail = `${uuid}@hiob-app.local`;

      // Create a Supabase client with the admin service role to manage users
      const supabase = createClient(
        Deno.env.get("SUPABASE_URL") ?? "",
        Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
      );

      // Create the user via the admin API
      const { data, error } = await supabase.auth.admin.createUser({
        id: uuid,
        email: syntheticEmail,
        password: password,
        email_confirm: true, // Auto-confirm the synthetic email
      });
      if (error) {
        if (error.code === "user_already_exists") {
          continue; // If the UUID collision occurs, generate a new one and try again
        }
        return new Response(
          JSON.stringify({ error: error.message } satisfies RegisterNewUserResponse),
          { headers: { "Content-Type": "application/json" }, status: 400 },
        );
      }

      return new Response(
        JSON.stringify({
          message: "User created successfully",
          user: data.user,
        } satisfies RegisterNewUserResponse),
        { headers: { "Content-Type": "application/json" }, status: 201 },
      );
    }
  } catch (err) {
    return new Response(
      JSON.stringify({
        error: err instanceof Error ? err.message : "Unknown error occurred",
      } satisfies RegisterNewUserResponse),
      { headers: { "Content-Type": "application/json" }, status: 500 },
    );
  }
});
