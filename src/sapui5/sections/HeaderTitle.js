import info from "../../data/info.json";
import profile from "../../assets/profile-no-bg.png";

const createHeaderTitle = (sap, options = {}) => {
  return new sap.uxap.ObjectPageHeader({
    objectTitle: info.name,
    objectSubtitle: info.role,
    objectImageURI: profile,
  });
};

export default createHeaderTitle;
