const createHeaderTitle = (sap, info, profile) => {
  if (!sap || !info) {
    throw new Error("Missing required parameters: sap or info");
  }

  return new sap.uxap.ObjectPageHeader({
    objectTitle: info.name,
    objectSubtitle: info.role,
    objectImageURI: profile,
  });
};

export default createHeaderTitle;
