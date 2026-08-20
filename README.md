# Project 2.0 V31

V31 adds account creation/login and cloud sync readiness using Supabase, while preserving local-first storage.

## One-time Supabase setup
1. Create a Supabase project.
2. Open **SQL Editor** and run `supabase-schema.sql`.
3. In Supabase, copy the **Project URL** and **anon/public key**.
4. Put those values into `config.js` as `PROJECT20_SUPABASE_URL` and `PROJECT20_SUPABASE_ANON_KEY`.
5. In Supabase Authentication > URL Configuration, add your GitHub Pages site URL to the allowed redirect/site URL list.

The anon/public key is intended for browser apps. Never put a service-role key in `config.js`.

## What account sync does
- Existing local data is uploaded the first time you sign up when the cloud account has no data.
- On later sign-in, cloud data is loaded onto the device.
- Changes made while signed in are saved locally and synced to the cloud.
- Data is isolated per authenticated user by Row Level Security.

## Deploying future versions
The included `.github/workflows/pages.yml` deploys the repository to GitHub Pages automatically after pushes to `main`, provided GitHub Pages is configured to use **GitHub Actions** as the source.
