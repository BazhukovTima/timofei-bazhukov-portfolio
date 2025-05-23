import React, { useState, useEffect } from "react";
import { useFramework } from "../../frameworkContext";
import info from "../../data/info.json";
import "./FloatingFrameworkIconSelector.css";

const importLogo = (logoFileName) => {
  try {
    return require(`../../assets/${logoFileName}`);
  } catch (error) {
    return null;
  }
};

const FloatingFrameworkIconSelector = () => {
  const { framework, setFramework } = useFramework();
  const frameworks = info.frameworks;

  const [isMobile, setIsMobile] = useState(window.innerWidth <= 768);
  const [expanded, setExpanded] = useState(true);

  useEffect(() => {
    const handleResize = () => {
      const mobile = window.innerWidth <= 768;
      setIsMobile(mobile);
      if (!mobile) setExpanded(true); // always expanded on desktop
    };
    window.addEventListener("resize", handleResize);
    return () => window.removeEventListener("resize", handleResize);
  }, []);

  return (
    <>
      {isMobile && (
        <button
          className={`floating-icon-toggle ${expanded ? "above" : "below"}`}
          onClick={() => setExpanded((prev) => !prev)}
          aria-label="Toggle frameworks"
        >
          <span className="arrow-icon">{expanded ? "↓" : "↑"}</span>
        </button>
      )}

      {expanded && (
        <div className="floating-icon-selector">
          {frameworks.map((fw) => {
            const logoSrc = importLogo(fw.logo);
            return (
              <div
                key={fw.name}
                className={`framework-icon ${fw.name === framework ? "selected" : ""}`}
                onClick={() => setFramework(fw.name)}
                title={fw.name}
              >
                {logoSrc ? (
                  <img src={logoSrc} alt={fw.name} className="framework-logo" />
                ) : (
                  <span className="placeholder">?</span>
                )}
              </div>
            );
          })}
        </div>
      )}
    </>
  );
};

export default FloatingFrameworkIconSelector;
