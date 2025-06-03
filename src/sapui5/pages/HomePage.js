import createAboutSection from "./sections/AboutSection.js";
import createTechnologiesSection from "./sections/TechnologiesSection.js";
import createHeaderContent from "./sections/HeaderContent.js";
import createHeaderTitle from "./sections/HeaderTitle.js";
import createExperienceSection from "./sections/ExperienceSection.js";

let oPage = null;

const HomePage = (container, info, profile) => {
  const sap = window.sap;

  if (oPage && oPage.destroy) {
    oPage.destroy();
    oPage = null;
  }

  oPage = new sap.uxap.ObjectPageLayout({
    headerTitle: createHeaderTitle(sap, info, profile),
    headerContent: createHeaderContent(sap, info, profile),
    sections: [
      createAboutSection(sap, info),
      createTechnologiesSection(sap, info),
      createExperienceSection(sap, info),
    ],
  });

  oPage.placeAt(container);
  return oPage;
};

export default HomePage;
