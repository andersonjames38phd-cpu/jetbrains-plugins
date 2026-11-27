#!/usr/bin/env bash
# JetBrains Plugins Scraper - curl examples
# Replace YOUR_TOKEN with an Apify API token (https://console.apify.com/account/integrations).

set -euo pipefail

ACTOR="Turboextract~jetbrains-plugins"
TOKEN="${APIFY_TOKEN:-YOUR_TOKEN}"

# 1. Paid and freemium AI plugins (start a run)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/runs?token=${TOKEN}" \n  -H "Content-Type: application/json" \n  -d '{
    "tags": [
      "AI"
    ],
    "pricing": "paid-or-freemium",
    "maxResults": 200
  }'

# 2. Kubernetes plugins for GoLand (start a run)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/runs?token=${TOKEN}" \n  -H "Content-Type: application/json" \n  -d '{
    "searchQueries": [
      "kubernetes"
    ],
    "product": "GO"
  }'

# 3. Newest database plugins (wait and get the dataset items in one call)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/run-sync-get-dataset-items?token=${TOKEN}" \n  -H "Content-Type: application/json" \n  -d '{
    "tags": [
      "Database"
    ],
    "sort": "newest",
    "maxResults": 50
  }'
