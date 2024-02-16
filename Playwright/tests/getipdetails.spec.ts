import { test, expect, firefox, chromium, defineConfig, devices } from '@playwright/test';

export default defineConfig({
    projects: [
        {
            name: 'chromium',
            use: {
                ...devices['Desktop Chrome'],
            },
        },
    ],
});

test('Get IP Details', async () => {
    const ipAddress = 'x.x.x.x';

    const browser = await chromium.launch();
    const context = await browser.newContext({
        javaScriptEnabled: true, // Enable JavaScript
        acceptDownloads: true, // Optional: Enable downloads
        permissions: ['geolocation'], // Optional: Grant additional permissions
    });
    const page = await context.newPage();

    await page.goto(`https://www.SomeSite.com`);

    await page.goto(`https://www.SomeSite.com/somepath?search=${ipAddress}`);

    await page.goto(`https://www.SomeSite.com`);

    // Expect a title "to contain" a substring.
    //   await expect(page).toHaveTitle(/Playwright/);
});


// const { chromium } = require('playwright');

// async function getIPInfo(ipAddress: string) {
//     const browser = await chromium.launch();
//     const context = await browser.newContext();
//     const page = await context.newPage();

//     await page.goto(`https://www.SomeSite.com/somepath?search=${ipAddress}#ip-addresses`);

//     // You may need to wait for the page to load completely, depending on the website
//     // Example: await page.waitForLoadState('load');

//     // Extracting Location Data
//     const locationData = await page.innerText('#location');

//     // Extracting Sender IP Reputation
//     const senderIPReputation = await page.innerText('#sender-ip-reputation');

//     await browser.close();

//     return { locationData: locationData.trim(), senderIPReputation: senderIPReputation.trim() };
// }

// async function main() {
//     const ipAddress = 'x.x.x.x'; // Replace with the actual IP address
//     const { locationData, senderIPReputation } = await getIPInfo(ipAddress);

//     console.log(`Location Data: ${locationData}`);
//     console.log(`Sender IP Reputation: ${senderIPReputation}`);
// }

// main();
