import profile from "../../../assets/profile-no-bg.png";
import info from "../../../data/info.json";

const createHeaderTitle = (sap) => {
  const { name, role } = info;

  return new sap.uxap.ObjectPageHeader({
    objectTitle: name,
    objectSubtitle: role,
    objectImageURI: profile,
    // Если понадобятся действия — можно добавить:
    // actions: [
    //   new sap.uxap.ObjectPageHeaderActionButton({
    //     icon: "sap-icon://add",
    //     text: "Add",
    //     press: () => alert("Add button pressed"),
    //   }),
    // ],
  });
};

export default createHeaderTitle;
