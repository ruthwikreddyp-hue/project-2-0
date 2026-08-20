# Project 2.0 — mobile prototype

A mobile-first Progressive Web App (PWA) for personal fitness tracking.

## Included
- Dashboard
- Weight logging and trend
- Push / Pull / Legs workout templates
- Set, rep, weight and RIR logging
- Workout history and estimated 1RM
- Calories, protein, carbs and fat
- Daily steps
- Local offline storage
- Installable PWA shell

## Run locally
A service worker requires HTTP(S), so don't open `index.html` directly for offline/install features.

From this folder run:

`python3 -m http.server 8080`

Then open `http://localhost:8080` on your computer. For phone testing on the same Wi-Fi, use your computer's LAN IP instead of localhost.

On iPhone Safari: Share → Add to Home Screen.
On Android Chrome: menu → Add to Home screen / Install app.

## Data
V1 stores data in the browser's localStorage. No account or server is required yet.
