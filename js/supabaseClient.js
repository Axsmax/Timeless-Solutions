import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

export default createClient(
  process.env.SUPABASE_URL,
  // Supabase publishable key (formerly `anon` key)
  process.env.SUPABASE_ANON_KEY,
  {
    auth: { persistSession: true }
  }
);
