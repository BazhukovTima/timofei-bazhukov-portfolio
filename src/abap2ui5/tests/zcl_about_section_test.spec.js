import { test, expect } from '@playwright/test';

test.describe('Profile About Elements', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
  });

  test('Displays about - expertise text', async ({ page }) => {
    const name = page.locator('[id="mainView--id_expertise"]');
    await expect(name.first()).toBeVisible();
  });

  test('Displays about - about focus header label', async ({ page }) => {
    const name = page.locator('[id="mainView--id_about_focus_header"]');
    await expect(name.first()).toBeVisible();
  });

  test('Displays about - about focus text', async ({ page }) => {
    const name = page.locator('[id="mainView--id_about_focus"]');
    await expect(name.first()).toBeVisible();
  });

  test('Displays about - technical stack header label', async ({ page }) => {
    const name = page.locator('[id="mainView--id_technical_stack_header"]');
    await expect(name.first()).toBeVisible();
  });

  test('Displays about - technical stack text', async ({ page }) => {
    const name = page.locator('[id="mainView--id_technical_stack"]');
    await expect(name.first()).toBeVisible();
  });

  test('Displays about - mobile header label', async ({ page }) => {
    const name = page.locator('[id="mainView--id_mobile_header"]');
    await expect(name.first()).toBeVisible();
  });

  test('Displays about - mobile text', async ({ page }) => {
    const name = page.locator('[id="mainView--id_mobile"]');
    await expect(name.first()).toBeVisible();
  });

  test('Displays about - soft skills header label', async ({ page }) => {
    const name = page.locator('[id="mainView--id_soft_skills_header"]');
    await expect(name.first()).toBeVisible();
  });

  test('Displays about - soft skills text', async ({ page }) => {
    const name = page.locator('[id="mainView--id_soft_skills"]');
    await expect(name.first()).toBeVisible();
  });
});
