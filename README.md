# Project 2.0 V34

V34 adds a shared cloud-managed content layer for the exercise and nutrition libraries.

## Supabase setup

1. Keep your existing `config.js` with the Project URL and anon/public key.
2. Run `supabase-global-schema.sql` in Supabase SQL Editor.
3. In Supabase → Authentication → Users, copy your own Project 2.0 user UUID.
4. Run the final `insert into public.project20_admins...` statement in the SQL file with your UUID.
5. Reload Project 2.0, open Account → Admin.

The Admin panel can edit/add/disable global exercises and foods. Changes are read from Supabase and become available to all users without a new app release.

Existing user-created exercises and foods remain private and are not overwritten by the global library.
