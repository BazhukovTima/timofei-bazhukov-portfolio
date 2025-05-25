import React, { useRef, useEffect } from "react";

const Abap2ui5Container = () => {
  const iframeRef = useRef(null);

  useEffect(() => {
    // Можно добавить коммуникацию с iframe, если нужно
    // Например, через postMessage
  }, []);

  return (
    <iframe
      ref={iframeRef}
      src="/abap2ui5/build/index.html"  // путь к сгенерированному бандлу вне src
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
