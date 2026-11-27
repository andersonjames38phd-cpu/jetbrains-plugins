"""JetBrains Plugins Scraper - Python example.

pip install apify-client
export APIFY_TOKEN=your_token
"""
import os

from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])

# Paid and freemium AI plugins
run = client.actor("Turboextract/jetbrains-plugins").call(run_input={
    "tags": [
        "AI"
    ],
    "pricing": "paid-or-freemium",
    "maxResults": 200
})

# Stream every item
for item in client.dataset(run["defaultDatasetId"]).iterate_items():
    print(item.get("name"), item.get("downloads"), item.get("vendorName"))

# Or fetch one page of items
page = client.dataset(run["defaultDatasetId"]).list_items(limit=100)
print(f"{page.total} items in dataset")
