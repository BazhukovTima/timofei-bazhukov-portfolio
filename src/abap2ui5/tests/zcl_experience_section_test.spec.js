import { test, expect } from '@playwright/test';

test.describe('Profile Experience Elements', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
  });

  test('Displays experience - header', async ({ page }) => {
    const name = page.locator('[id="mainView--id_experience_header"]');
    await expect(name.first()).toBeVisible();
  });

test('Experience items should be rendered', async ({ page }) => {
  const experienceItems = page.locator('[id^="mainView--id_exp_"]');
  await expect(experienceItems.first()).toBeVisible();
  const count = await experienceItems.count();
  expect(count).toBeGreaterThan(0);
});
  
});
