import React from "react";
import TooltipIcon from "./TooltipIcon";
import info from "../../data/info.json";

import "./colors.css";
import "./Portfolio.css";

const Portfolio = () => {
  const projects = info.portfolio.projects;

  return (
    <div className="portfolio-page">
      <section id="portfolio" className="portfolio-section">
        <h2 className="portfolio-title">Portfolio</h2>

        <p className="portfolio-intro">{info.portfolio.overview}</p>

        <div className="portfolio-grid">
          {Object.entries(projects).map(([projectName, projectData]) => (
            <div className="portfolio-item" key={projectName}>
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

export default Portfolio;
