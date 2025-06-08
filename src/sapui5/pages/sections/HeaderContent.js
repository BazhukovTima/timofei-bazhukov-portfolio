const createHeaderContent = (sap, info, profile) => {
  if (!sap || !info) {
    throw new Error("Missing required parameters: sap or info");
  }

  const {
    name = "",
    role = "",
    location = "",
    description = "",
    social = [],
  } = info || {};

  return new sap.ui.layout.VerticalLayout({
    width: "100%",
    content: [
      new sap.ui.layout.BlockLayout({
        content: [
          new sap.ui.layout.BlockLayoutRow({
            content: [
              new sap.ui.layout.BlockLayoutCell({
                content: [
                  new sap.m.Avatar({
                    src: profile || "",
                    displaySize: "Custom",
                    customDisplaySize: "15em",
                    displayShape: "Circle",
                    backgroundColor: sap.m.AvatarColor?.TileIcon || "Accent6",
                    showBorder: true,
                  }),
                ],
              }),
              new sap.ui.layout.BlockLayoutCell({
                title: name,
                content: [
                  new sap.m.ObjectStatus({
                    text: role,
                    icon: "sap-icon://suitcase",
                  }).addStyleClass("info-line"),
                  new sap.m.ObjectStatus({
                    text: location,
                    icon: "sap-icon://map",
                  }).addStyleClass("info-line"),
                  new sap.m.ObjectStatus({
                    text: description,
                    icon: "sap-icon://hint",
                  }).addStyleClass("info-line"),
                  new sap.m.HBox({
                    alignItems: "Center",
                    items: [
                      new sap.m.ObjectStatus({
                        icon: "sap-icon://chain-link",
                      }),
                      ...social.map((item, index) => {
                        const link = new sap.m.Link({
                          text: item.platform,
                          href: item.url,
                          target: "_blank",
                          tooltip: item.platform,
                        });
                        if (index !== 0) {
                          link.addStyleClass("sapUiTinyMarginBegin");
                        }
                        return link;
                      }),
                    ],
                  }),
                ],
              }),
              new sap.ui.layout.BlockLayoutCell({}),
              new sap.ui.layout.BlockLayoutCell({}),
            ],
          }),
        ],
      }),
    ],
  });
};

export default createHeaderContent;
