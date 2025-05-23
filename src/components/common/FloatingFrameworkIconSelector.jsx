import React from "react";
import { useFramework } from "../../frameworkContext";
import info from "../../data/info.json";
import "./FloatingFrameworkIconSelector.css";

// Динамический импорт логотипов из папки assets
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

  return (
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
  );
};

export default FloatingFrameworkIconSelector;
