import createAboutSection from "../sections/AboutSection";
import createTechnologiesSection from "../sections/TechnologiesSection";
import createHeaderContent from "../sections/HeaderContent";
import createHeaderTitle from "../sections/HeaderTitle";
import createExperienceSection from "../sections/ExperienceSection";

let oPage = null;

const HomePage = (container) => {
  const sap = window.sap;

  if (oPage && oPage.destroy) {
    oPage.destroy();
    oPage = null;
  }

  oPage = new sap.uxap.ObjectPageLayout({
    headerTitle: createHeaderTitle(sap),
    headerContent: createHeaderContent(sap),
    sections: [
      createAboutSection(sap),
      createTechnologiesSection(sap),
      createExperienceSection(sap),
    ],
  });

  oPage.placeAt(container);
  return oPage;
};

export default HomePage;
