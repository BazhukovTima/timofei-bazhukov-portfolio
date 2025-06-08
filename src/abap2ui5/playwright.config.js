// @ts-check
const { defineConfig } = require('@playwright/test');

module.exports = defineConfig({
  testDir: './tests',
  timeout: 30 * 1000,
  retries: 0,
  use: {
    baseURL: 'http://localhost:3000',
    headless: true,
    trace: 'on-first-retry',
  },
  webServer: {
    command: 'npm run serve:build',
    url: 'http://localhost:3000',
    reuseExistingServer: !process.env.CI,
    timeout: 10 * 1000,
  },
});
