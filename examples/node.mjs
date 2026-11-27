// JetBrains Plugins Scraper - Node.js example
// npm install apify-client
// APIFY_TOKEN=your_token node node.mjs
import { ApifyClient } from 'apify-client';

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });

// Kubernetes plugins for GoLand
const run = await client.actor('Turboextract/jetbrains-plugins').call({
    "searchQueries": [
        "kubernetes"
    ],
    "product": "GO"
});

const { items } = await client.dataset(run.defaultDatasetId).listItems();
for (const item of items) {
    console.log(item.name, item.downloads, item.vendorName);
}
