import info from "../../../data/info.json";

const createAboutSection = (sap) => {
  return new sap.uxap.ObjectPageSection({
    title: info.about.header,
    subSections: [
      new sap.uxap.ObjectPageSubSection({
        blocks: [
          new sap.ui.layout.VerticalLayout({
            width: "100%",
            content: [
              new sap.m.Text({
                text: info.about.expertise.description,
                width: "100%",
                wrapping: true,
              }),
              new sap.m.VBox({ height: "1rem" }), // небольшой отступ
              new sap.ui.layout.BlockLayout({
                content: [
                  new sap.ui.layout.BlockLayoutRow({
                    content: [
                      new sap.ui.layout.BlockLayoutCell({
                        title: info.about.currentFocus.header,
                        content: [
                          new sap.m.Text({
                            text: info.about.currentFocus.description,
                          }),
                        ],
                      }),
                      new sap.ui.layout.BlockLayoutCell({
                        title: info.about.technicalStack.header,
                        content: [
                          new sap.m.Text({
                            text: info.about.technicalStack.description,
                          }),
                        ],
                      }),
                      new sap.ui.layout.BlockLayoutCell({
                        title: info.about.mobileDevelopment.header,
                        content: [
                          new sap.m.Text({
                            text: info.about.mobileDevelopment.description,
                          }),
                        ],
                      }),
                      new sap.ui.layout.BlockLayoutCell({
                        title: info.about.softSkills.header,
                        content: [
                          new sap.m.Text({
                            text: info.about.softSkills.description,
                          }),
                        ],
                      }),
                    ],
                  }),
                ],
              }),
            ],
          }),
        ],
      }),
    ],
  });
};

export default createAboutSection;
