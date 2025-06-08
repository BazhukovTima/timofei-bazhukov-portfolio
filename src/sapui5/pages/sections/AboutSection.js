const createAboutSection = (sap, info) => {
  if (!sap || !info?.about) {
    throw new Error("Missing required parameters: sap or info.about");
  }

  const { about } = info;

  const makeCell = (title, text) =>
    new sap.m.VBox({
      items: [
        new sap.m.Title({ text: title, level: "H5" }).addStyleClass("sapUiTinyMarginBottom"),
        new sap.m.Text({ text: text, wrapping: true }).addStyleClass("sapUiSmallText"),
      ],
      layoutData: new sap.ui.layout.GridData({ span: "L3 M6 S12" }),
    });

  return new sap.uxap.ObjectPageSection({
    title: about.header || "About",
    subSections: [
      new sap.uxap.ObjectPageSubSection({
        blocks: [
          new sap.ui.layout.VerticalLayout({
            width: "100%",
            content: [
              new sap.m.Text({
                text: about.expertise?.description || "",
                width: "100%",
                wrapping: true,
              }),
              new sap.m.VBox({ height: "1rem" }),
              new sap.ui.layout.Grid({
                defaultSpan: "L3 M6 S12",
                hSpacing: 2,
                vSpacing: 2,
                content: [
                  makeCell(about.currentFocus?.header || "", about.currentFocus?.description || ""),
                  makeCell(about.technicalStack?.header || "", about.technicalStack?.description || ""),
                  makeCell(about.mobileDevelopment?.header || "", about.mobileDevelopment?.description || ""),
                  makeCell(about.softSkills?.header || "", about.softSkills?.description || ""),
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
