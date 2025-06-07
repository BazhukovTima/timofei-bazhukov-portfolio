import { test, expect } from "@playwright/test";

test.describe("Profile Technologies Elements", () => {
  test.beforeEach(async ({ page }) => {
    await page.goto("/");
  });

  test("Displays technologies - header", async ({ page }) => {
    const name = page.locator('[id="mainView--id_tech_header"]');
    await expect(name.first()).toBeVisible();
  });

  test("Displays technologies - skills sap header label", async ({ page }) => {
    const name = page.locator('[id="mainView--id_skills_sap_header"]');
    await expect(name.first()).toBeVisible();
  });

  test("Displays technologies - skills sap text", async ({ page }) => {
    const name = page.locator('[id="mainView--id_skills_sap"]');
    await expect(name.first()).toBeVisible();
  });

  test("Displays technologies - skills mobile header label", async ({ page }) => {
    const name = page.locator('[id="mainView--id_skills_mobile_header"]');
    await expect(name.first()).toBeVisible();
  });

  test("Displays technologies - skills mobile text", async ({ page }) => {
    const name = page.locator('[id="mainView--id_skills_mobile"]');
    await expect(name.first()).toBeVisible();
  });

  test("Displays technologies - skills devops header label", async ({ page }) => {
    const name = page.locator('[id="mainView--id_skills_devops_header"]');
    await expect(name.first()).toBeVisible();
  });

  test("Displays technologies - skills devops text", async ({ page }) => {
    const name = page.locator('[id="mainView--id_skills_devops"]');
    await expect(name.first()).toBeVisible();
  });

  test("Displays technologies - skills other header label", async ({ page }) => {
    const name = page.locator('[id="mainView--id_skills_other_header"]');
    await expect(name.first()).toBeVisible();
  });

  test("Displays technologies - skills other text", async ({ page }) => {
    const name = page.locator('[id="mainView--id_skills_other"]');
    await expect(name.first()).toBeVisible();
  });
});
