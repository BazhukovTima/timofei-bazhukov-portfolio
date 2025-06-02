import info from "../../data/info.json";

const createAboutSection = (sap) => {
  const makeCell = (title, text) =>
    new sap.m.VBox({
      items: [
        new sap.m.Title({
          text: title,
          level: "H5",
        }).addStyleClass("sapUiTinyMarginBottom"),
        new sap.m.Text({
          text: text,
          wrapping: true,
        }).addStyleClass("sapUiSmallText"),
      ],
      layoutData: new sap.ui.layout.GridData({ span: "L3 M6 S12" }),
    });

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
              new sap.m.VBox({ height: "1rem" }),
              new sap.ui.layout.Grid({
                defaultSpan: "L3 M6 S12",
                hSpacing: 2,
                vSpacing: 2,
                content: [
                  makeCell(info.about.currentFocus.header, info.about.currentFocus.description),
                  makeCell(info.about.technicalStack.header, info.about.technicalStack.description),
                  makeCell(info.about.mobileDevelopment.header, info.about.mobileDevelopment.description),
                  makeCell(info.about.softSkills.header, info.about.softSkills.description),
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
