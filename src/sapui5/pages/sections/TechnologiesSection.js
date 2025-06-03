const createTechnologiesSection = (sap, info) => {
  if (!sap || !info || !info.skills || !info.skills.skills) {
    throw new Error("Missing required parameters: sap or info.skills.skills");
  }

  const categoryColumns = Object.entries(info.skills.skills).map(([key, category]) => {
    const skills = Array.isArray(category.skills) ? category.skills : [];

    const skillWrapBox = new sap.m.FlexBox({
      wrap: sap.m.FlexWrap.Wrap,
      direction: sap.m.FlexDirection.Row,
      items: skills.map((skill) =>
        new sap.m.Label({
          text: skill || "",
        }).addStyleClass("sapui5SkillPill")
      ),
    });

    return new sap.m.VBox({
      items: [
        new sap.m.Title({
          text: category.title || "",
          level: "H4",
        }).addStyleClass("sapUiSmallMarginBottom"),
        skillWrapBox,
      ],
      layoutData: new sap.ui.layout.GridData({
        span: "L3 M6 S12",
      }),
    });
  });

  const skillGrid = new sap.ui.layout.Grid({
    defaultSpan: "L3 M6 S12",
    content: categoryColumns,
  });

  return new sap.uxap.ObjectPageSection({
    title: "Technologies and Frameworks",
    subSections: [
      new sap.uxap.ObjectPageSubSection({
        blocks: [
          new sap.ui.layout.VerticalLayout({
            width: "100%",
            content: [
              new sap.m.Text({
                text: info.skills.description || "",
                width: "100%",
                wrapping: true,
              }),
              new sap.m.VBox({ height: "2rem" }),
              skillGrid,
            ],
          }),
        ],
      }),
    ],
  });
};

export default createTechnologiesSection;
