# Project 2.0 V63

V63 fixes local startup when `config.js` is not present by making the Supabase configuration optional. The app can now run locally without credentials, while an existing `config.js` is still respected for cloud features.

Keep your existing `config.js` when deploying to GitHub Pages.
