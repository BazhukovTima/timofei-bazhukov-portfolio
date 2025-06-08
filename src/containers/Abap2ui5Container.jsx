import React, { useRef } from "react";

const Abap2ui5Container = () => {
  const iframeRef = useRef(null);
  const basePath = process.env.PUBLIC_URL || "";

  return (
    <iframe
      ref={iframeRef}
      src={`${basePath}/abap2ui5/index.html`}
      style={{
        width: "100vw",
        height: "100vh",
        border: "none",
      }}
      title="ABAP2UI5"
    />
  );
};

export default Abap2ui5Container;
