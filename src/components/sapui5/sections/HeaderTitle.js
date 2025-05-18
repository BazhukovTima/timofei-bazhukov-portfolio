import info from "../../../data/info.json";
import profile from "../../../assets/profile-no-bg.png";

const createFrameworkSelector = (sap, onFrameworkChange, currentFramework) => {
  const frameworks = info.frameworks;

  const oVBox = new sap.m.VBox({ width: "150px" });

  const oButton = new sap.m.Button({
    text: currentFramework || frameworks[0],
    icon: "sap-icon://slim-arrow-down",
    iconPosition: "Right",
    type: "Transparent",
  });

  const oPopover = new sap.m.Popover({
    showHeader: false,
    placement: sap.m.PlacementType.Bottom,
    content: [],
  });

  const selectFramework = (fw) => {
    oButton.setText(fw);
    oPopover.close();
    if (typeof onFrameworkChange === "function") {
      onFrameworkChange(fw);
    }
  };

  frameworks.forEach((fw) => {
    const oItemBtn = new sap.m.Button({
      text: fw,
      type: sap.m.ButtonType.Transparent,
      width: "100%",
      press: () => selectFramework(fw),
    });
    oPopover.addContent(oItemBtn);
  });

  oButton.attachPress(() => {
    if (oPopover.isOpen()) {
      oPopover.close();
    } else {
      oPopover.openBy(oButton);
    }
  });

  oVBox.addItem(oButton);

  return oVBox;
};

const createHeaderTitle = (sap, options = {}) => {
  const { onFrameworkChange, currentFramework } = options;

  return new sap.uxap.ObjectPageHeader({
    objectTitle: info.name,
    objectSubtitle: info.role,
    objectImageURI: profile,
    actions: [
      createFrameworkSelector(sap, onFrameworkChange, currentFramework),
    ],
  });
};

export default createHeaderTitle;
