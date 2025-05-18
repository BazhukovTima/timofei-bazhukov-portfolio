import React from "react";
import TooltipIcon from "./TooltipIcon";
import info from "../../data/info.json";

import "./colors.css";
import "./Experience.css";

const Experience = () => {
  const projects = info.experience.projects;

  return (
    <div className="experience-page">
      <section id="experience" className="experience-section">
        <h2 className="experience-title">Experience</h2>

        <p className="experience-intro">{info.experience.overview}</p>

        <div className="experience-grid">
          {Object.entries(projects).map(([projectName, projectData]) => (
            <div className="experience-item" key={projectName}>
              <TooltipIcon description={projectData.details} />

              <div className="project-header">
                <h3 className="project-title">
                  {projectName} — {projectData.role}
                </h3>
              </div>
              <p className="project-company">{projectData.company}</p>
              <p className="project-tech">{projectData.technologies}</p>
            </div>
          ))}
        </div>
      </section>
    </div>
  );
};

export default Experience;
