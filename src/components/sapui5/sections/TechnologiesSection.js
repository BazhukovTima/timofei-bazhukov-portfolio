import info from "../../../data/info.json";

const createTechnologiesSection = (sap) => {
  const skillBox = new sap.m.FlexBox({
    wrap: sap.m.FlexWrap.Wrap,
    justifyContent: "Start",
    items: info.skills.skills.map((skill) =>
      new sap.m.Label({
        text: skill,
      }).addStyleClass("sapui5SkillPill")
    ),
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
                text: info.skills.description,
                width: "100%",
                wrapping: true,
              }),
              new sap.m.VBox({ height: "2rem" }), // отступ
              skillBox,
            ],
          }),
        ],
      }),
    ],
  });
};

export default createTechnologiesSection;
