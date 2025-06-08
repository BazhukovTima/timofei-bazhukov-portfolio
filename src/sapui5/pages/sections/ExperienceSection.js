const createExperienceSection = (sap, info) => {
  if (!sap || !info || !info.experience) {
    throw new Error("Missing required parameters: sap or info.experience");
  }

  const projects = info.experience.projects || {};
  const overviewText = info.experience.overview || "";

  const projectPanels = Object.entries(projects).map(([title, project]) => {
    const mainContent = [
      new sap.m.Label({ text: `${project.role || ""} @ ${project.company || ""}`, design: "Bold" }),
      new sap.m.ObjectStatus({ text: project.period || "", icon: "sap-icon://calendar" }),
    ];

    const detailsContent = [
      new sap.m.Text({ text: project.details || "", wrapping: true }),
    ];
    if (project.technologies) {
      detailsContent.push(new sap.m.Text({ text: `🔧 ${project.technologies}`, wrapping: true }));
    }

    return new sap.m.Panel({
      expandable: false,
      headerText: title,
      width: "100%",
      height: "15em",
      content: [
        new sap.ui.layout.VerticalLayout({
          content: [
            ...mainContent,
            ...detailsContent,
          ],
        }).addStyleClass("myVerticalLayoutSpacing alignTopLayout"),
      ],
    }).addStyleClass("sapUiSmallMarginBottom fixedHeightPanel");
  });

  const projectGrid = new sap.ui.layout.Grid({
    defaultSpan: "L4 M6 S12",
    hSpacing: 1,
    vSpacing: 1,
    content: projectPanels,
  });

  return new sap.uxap.ObjectPageSection({
    title: "Experience",
    subSections: [
      new sap.uxap.ObjectPageSubSection({
        blocks: [
          new sap.m.VBox({
            width: "100%",
            items: [
              new sap.m.Text({ text: overviewText, width: "100%", wrapping: true }),
              new sap.m.VBox({ height: "2rem" }),
              projectGrid,
            ],
          }),
        ],
      }),
    ],
  });
};

export default createExperienceSection;
