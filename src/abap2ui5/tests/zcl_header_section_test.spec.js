import { test, expect } from '@playwright/test';

test.describe('Profile Header Elements', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
  });

  test('Displays user header name', async ({ page }) => {
    const name = page.locator('[id="mainView--id_name"]');
    await expect(name.first()).toBeVisible();
  });

  test('Displays user image', async ({ page }) => {
    const role = page.locator('[id="mainView--id_image_url"]');
    await expect(role.first()).toBeVisible();
  });

  test('Displays user name', async ({ page }) => {
    const role = page.locator('[id="mainView--id_name_title"]');
    await expect(role.first()).toBeVisible();
  });

  test('Displays user role', async ({ page }) => {
    const role = page.locator('[id="mainView--id_role"]');
    await expect(role.first()).toBeVisible();
  });

  test('Displays user location', async ({ page }) => {
    const location = page.locator('[id="mainView--id_location"]');
    await expect(location.first()).toBeVisible();
  });

  test('Displays user description', async ({ page }) => {
    const description = page.locator('[id="mainView--id_description"]');
    await expect(description.first()).toBeVisible();
  });

  test('Has LinkedIn link', async ({ page }) => {
    const linkedin = page.locator('[id="mainView--id_linkedin"]');
    await expect(linkedin).toBeVisible();
  });

  test('Has Facebook link', async ({ page }) => {
    const facebook = page.locator('[id="mainView--id_facebook"]');
    await expect(facebook).toBeVisible();
  });

  test('Has GitHub link', async ({ page }) => {
    const github = page.locator('[id="mainView--id_github"]');
    await expect(github).toBeVisible();
  });

  test('Has Email link', async ({ page }) => {
    const email = page.locator('[id="mainView--id_email"]');
    await expect(email).toBeVisible();
  });
});
