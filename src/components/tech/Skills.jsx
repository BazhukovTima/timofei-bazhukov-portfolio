import React from "react";
import "../../styles/ResponsiveTech.css";
import info from "../../data/info.json";

const Skills = () => (
  <div className="skills-section">
    <div className="skills-grid">
      {info.skills.skills.map((skill, index) => (
        <div key={index} className="skill-item">
          {skill}
        </div>
      ))}
    </div>
  </div>
);

export default Skills;
