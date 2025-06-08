import React, { useEffect, useRef, useState } from "react";
import HomePage from "../sapui5/pages/HomePage.js";
import "../sapui5/sapui5CustomStyles.css";
import info from "../data/info.json";
import profile from "../assets/profile-no-bg.png";

const SapUi5Container = () => {
  const containerRef = useRef(null);
  const [ui5Initialized, setUi5Initialized] = useState(false);
  const ui5ComponentRef = useRef(null);

  useEffect(() => {
    if (!window.sap || !window.sap.ui || !window.sap.ui.getCore) {
      console.error("SAPUI5 is not loaded");
      return;
    }

    window.sap.ui.getCore().attachInit(() => {
      setUi5Initialized(true);
    });
  }, []);

  useEffect(() => {
    if (ui5Initialized && containerRef.current) {
      if (ui5ComponentRef.current?.destroy) {
        ui5ComponentRef.current.destroy();
        ui5ComponentRef.current = null;
      }

      const page = HomePage(containerRef.current, info, profile);
      ui5ComponentRef.current = page;
    }

    return () => {
      if (ui5ComponentRef.current?.destroy) {
        ui5ComponentRef.current.destroy();
        ui5ComponentRef.current = null;
      }
    };
  }, [ui5Initialized]);

  return (
    <div
      id="sapui5-root"
      ref={containerRef}
      style={{
        height: "100vh",
        minHeight: "600px",
        overflow: "hidden",
        position: "relative",
        background: "white",
      }}
    />
  );
};

export default SapUi5Container;
