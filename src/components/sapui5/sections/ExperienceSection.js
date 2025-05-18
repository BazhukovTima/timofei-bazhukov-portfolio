import info from "../../../data/info.json";

const createExperienceSection = (sap) => {
  const projects = info.experience.projects;
  const overviewText = info.experience.overview;

  // Создаем Popover один на всю секцию — контент будем менять динамически
  const oPopover = new sap.m.Popover({
    placement: sap.m.PlacementType.Bottom,
    showHeader: true,
    contentWidth: "300px",
    content: new sap.ui.layout.VerticalLayout({ content: [] }),
  });

  // Функция для заполнения поповера данными проекта
  const showProjectDetails = (project, headerText, opener) => {
    oPopover.setTitle(headerText);

    const content = [
      new sap.m.Label({ text: `${project.role} @ ${project.company}`, design: "Bold" }),
      new sap.m.ObjectStatus({ text: project.period, icon: "sap-icon://calendar" }),
      new sap.m.Text({ text: project.details, wrapping: true }),
    ];
    if (project.technologies) {
      content.push(new sap.m.Text({ text: `🔧 ${project.technologies}`, wrapping: true }));
    }

    oPopover.removeAllContent();
    oPopover.addContent(new sap.ui.layout.VerticalLayout({ content }));

    oPopover.openBy(opener);
  };

  // Создаем панели с кнопкой "Details"
  const projectPanels = Object.entries(projects).map(([title, project]) => {
    const btnDetails = new sap.m.Button({
      text: "Details",
      type: "Transparent",
      press: function (evt) {
        showProjectDetails(project, title, evt.getSource());
      },
    });

    return new sap.m.Panel({
      expandable: false,
      headerText: title,
      width: "100%", // для корректного отображения в Grid
      content: [
        new sap.ui.layout.VerticalLayout({
          content: [
            new sap.m.Label({ text: `${project.role} @ ${project.company}`, design: "Bold" }),
            new sap.m.ObjectStatus({ text: project.period, icon: "sap-icon://calendar" }),
            btnDetails,
          ],
        }),
      ],
    }).addStyleClass("sapUiSmallMarginBottom");
  });

  // Grid для 3 колонок с отступами
  const projectGrid = new sap.ui.layout.Grid({
    defaultSpan: "L4 M6 S12", // L (large screen) - 12/4=3 колонки, M - 2 колонки, S - 1 колонка
    hSpacing: 1, // горизонтальный отступ
    vSpacing: 1, // вертикальный отступ
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
              new sap.m.VBox({ height: "2rem" }), // отступ
              projectGrid,
            ],
          }),
        ],
      }),
    ],
  });
};

export default createExperienceSection;
