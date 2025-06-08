import { useState, useEffect } from "react";
import { useFramework } from "../../../frameworkContext";
import info from "../../../data/info.json";
import "../../styles/FloatingFrameworkIconSelector.css";

const importLogo = (logoFileName) => {
  try {
    return require(`../../../assets/${logoFileName}`);
  } catch (error) {
    return null;
  }
};

const FloatingFrameworkIconSelector = () => {
  const { framework } = useFramework();
  const frameworks = info.frameworks;

  const [isMobile, setIsMobile] = useState(window.innerWidth <= 768);
  const [expanded, setExpanded] = useState(true);

  const isFlutter = framework === "Flutter";
  const bottomOffset = isFlutter ? "4.5rem" : "1rem";
  const iconSelectorOffset = isFlutter
    ? "calc(4.5rem + 40px + 8px)"
    : "calc(1rem + 40px + 8px)";

  useEffect(() => {
    const handleResize = () => {
      const mobile = window.innerWidth <= 768;
      setIsMobile(mobile);
      if (!mobile) setExpanded(true);
    };
    window.addEventListener("resize", handleResize);
    return () => window.removeEventListener("resize", handleResize);
  }, []);

  const handleFrameworkChange = (fwName) => {
    if (fwName !== localStorage.getItem("framework")) {
      localStorage.setItem("framework", fwName);
      window.location.reload();
    }
  };

  return (
    <>
      {isMobile && (
        <button
          className={`floating-icon-toggle ${expanded ? "above" : "below"}`}
          onClick={() => setExpanded((prev) => !prev)}
          aria-label="Toggle frameworks"
          style={{ bottom: bottomOffset }}
        >
          <span className="arrow-icon">{expanded ? "↓" : "↑"}</span>
        </button>
      )}

      {expanded && (
        <div
          className="floating-icon-selector"
          style={{ bottom: iconSelectorOffset }}
        >
          {frameworks.map((fw) => {
            const logoSrc = importLogo(fw.logo);
            return (
              <div
                key={fw.name}
                className={`framework-icon ${
                  fw.name === framework ? "selected" : ""
                }`}
                onClick={() => handleFrameworkChange(fw.name)}
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
