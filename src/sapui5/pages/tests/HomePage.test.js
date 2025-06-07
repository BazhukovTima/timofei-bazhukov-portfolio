import esmock from "esmock";
import path from "path";
import url from "url";
import QUnit from "qunit";

const __filename = url.fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

global.window = {
  sap: {
    uxap: {
      ObjectPageLayout: class {
        constructor(opts) {
          this.opts = opts;
          this.destroyed = false;
        }
        placeAt(container) {
          this.container = container;
        }
        destroy() {
          this.destroyed = true;
        }
      },
    },
  },
};

const mockCreateAboutSection = () => "aboutSection";
const mockCreateTechnologiesSection = () => "technologiesSection";
const mockCreateHeaderContent = () => "headerContent";
const mockCreateHeaderTitle = () => "headerTitle";
const mockCreateExperienceSection = () => "experienceSection";

const mockInfo = { name: "Test User" };
const mockProfile = "mock-profile.png";

let HomePage;

QUnit.test("HomePage creates page correctly", async (assert) => {
  HomePage = await esmock(
    path.resolve(__dirname, "../HomePage.js"),
    {
      [path.resolve(__dirname, "../sections/AboutSection.js")]: mockCreateAboutSection,
      [path.resolve(__dirname, "../sections/TechnologiesSection.js")]: mockCreateTechnologiesSection,
      [path.resolve(__dirname, "../sections/HeaderContent.js")]: mockCreateHeaderContent,
      [path.resolve(__dirname, "../sections/HeaderTitle.js")]: mockCreateHeaderTitle,
      [path.resolve(__dirname, "../sections/ExperienceSection.js")]: mockCreateExperienceSection,
    }
  );

  const container = {};
  const page = HomePage(container, mockInfo, mockProfile);

  assert.ok(page, "Page was created");
  assert.equal(page.container, container, "Page placed in container");
  assert.equal(page.opts.headerTitle, "headerTitle", "Header title created");
  assert.equal(page.opts.headerContent, "headerContent", "Header content created");
  assert.deepEqual(
    page.opts.sections,
    ["aboutSection", "technologiesSection", "experienceSection"],
    "Sections created"
  );
});

QUnit.test("HomePage destroys previous page on re-creation", async (assert) => {
  if (!HomePage) {
    HomePage = await esmock(
      path.resolve(__dirname, "../HomePage.js"),
      {
        [path.resolve(__dirname, "../sections/AboutSection.js")]: mockCreateAboutSection,
        [path.resolve(__dirname, "../sections/TechnologiesSection.js")]: mockCreateTechnologiesSection,
        [path.resolve(__dirname, "../sections/HeaderContent.js")]: mockCreateHeaderContent,
        [path.resolve(__dirname, "../sections/HeaderTitle.js")]: mockCreateHeaderTitle,
        [path.resolve(__dirname, "../sections/ExperienceSection.js")]: mockCreateExperienceSection,
      }
    );
  }

  const container = {};

  const firstPage = HomePage(container, mockInfo, mockProfile);
  assert.notOk(firstPage.destroyed, "First page is not destroyed initially");

  const secondPage = HomePage(container, mockInfo, mockProfile);
  assert.ok(firstPage.destroyed, "First page destroyed on second call");
  assert.ok(secondPage, "Second page created");
  assert.notEqual(firstPage, secondPage, "New page instance created");
});
