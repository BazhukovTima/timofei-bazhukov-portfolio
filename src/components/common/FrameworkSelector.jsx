import React, { useState, useRef, useEffect } from "react";
import "./FrameworkSelector.css";
import { ChevronDown } from "lucide-react";
import info from '../../data/info.json';
import { useFramework } from "../../frameworkContext";

const frameworks = info.frameworks;

const FrameworkSelector = () => {
  const { framework, setFramework } = useFramework();
  const [open, setOpen] = useState(false);
  const ref = useRef();

  const toggleOpen = () => setOpen((prev) => !prev);

  const handleSelect = (fw) => {
    setFramework(fw);
    setOpen(false);
  };

  useEffect(() => {
    const handleClickOutside = (e) => {
      if (ref.current && !ref.current.contains(e.target)) {
        setOpen(false);
      }
    };
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, []);

  return (
    <div className="framework-dropdown-container" ref={ref}>
      <div className="framework-display" onClick={toggleOpen}>
        <span>{framework}</span>
        <ChevronDown size={16} className={`chevron ${open ? "rotate" : ""}`} />
      </div>

      {open && (
        <div className="framework-list">
          {frameworks.map((fw) => (
            <div
              key={fw}
              className={`framework-list-item ${fw === framework ? "selected" : ""}`}
              onClick={() => handleSelect(fw)}
            >
              {fw}
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default FrameworkSelector;
