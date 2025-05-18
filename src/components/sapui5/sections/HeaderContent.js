import profile from "../../../assets/profile-no-bg.png";
import info from "../../../data/info.json";

const createHeaderContent = (sap) => {
  const { name, role, location, description, social } = info;

  return [
    new sap.ui.layout.VerticalLayout({
      content: [
        new sap.m.Avatar({
          src: profile,
          displaySize: "Custom",
          customDisplaySize: "15em",
          displayShape: "Circle",
          backgroundColor: sap.m.AvatarColor.TileIcon,
          showBorder: true,
        }),
      ],
    }),
    new sap.ui.layout.VerticalLayout({
      content: [
        new sap.m.Label({ text: name, design: "Bold" }),
        new sap.m.ObjectStatus({ text: role, icon: "sap-icon://suitcase" }),
        new sap.m.ObjectStatus({ text: location, icon: "sap-icon://map" }),
        new sap.m.Text({ width: "20em", text: description }),
      ],
    }),
    ...social.map((item) =>
      new sap.m.Link({
        text: item.platform,
        href: item.url,
      })
    ),
  ];
};

export default createHeaderContent;
