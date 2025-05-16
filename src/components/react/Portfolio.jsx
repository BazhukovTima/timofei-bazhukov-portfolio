import React from "react";

import './colors.css';
import './Portfolio.css';
import info from '../../data/info.json';

const Portfolio = () => {
  const { sapWorkExperience, nonSapWorkExperience } = info.portfolio;

  return (
    <section id="portfolio" className="portfolio-section">
      <h2 className="portfolio-title">Portfolio</h2>

      <div className="portfolio-category">
        {sapWorkExperience.map((item, index) => (
          <div key={index} className="portfolio-item">
            <h4>{item.company} — <span className="role">{item.role}</span></h4>
            <p className="period">{item.period}</p>
            {item.projects.length > 0 && (
              <>
                <h5>Projects:</h5>
                <ul>
                  {item.projects.map((project, idx) => (
                    <li key={idx}>{project}</li>
                  ))}
                </ul>
              </>
            )}
            <p className="details">{item.details}</p>
            <p className="technologies"><strong>Technologies:</strong> {item.technologies}</p>
          </div>
        ))}
      </div>

      <div className="portfolio-category">
        {nonSapWorkExperience.map((item, index) => (
          <div key={index} className="portfolio-item">
            <h4>{item.company} — <span className="role">{item.role}</span></h4>
            <p className="period">{item.period}</p>
            {item.projects.length > 0 && (
              <>
                <h5>Projects:</h5>
                <ul>
                  {item.projects.map((project, idx) => (
                    <li key={idx}>{project}</li>
                  ))}
                </ul>
              </>
            )}
            <p className="details">{item.details}</p>
            {item.technologies && <p className="technologies"><strong>Technologies:</strong> {item.technologies}</p>}
          </div>
        ))}
      </div>
    </section>
  );
};

export default Portfolio;
