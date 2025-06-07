import React from "react";
import "../styles/colors.css";
import "../styles/ResponsiveAbout.css";

const About = ({ info }) => {
  const about = info?.about;

  if (!about) return null;

  const {
    header,
    expertise,
    currentFocus,
    technicalStack,
    mobileDevelopment,
    softSkills,
  } = about;

  return (
    <section id="about" className="about-section">
      <div className="about-background" />
      {header && <h2 className="about-title">{header}</h2>}
      {expertise?.description && (
        <p className="about-intro">{expertise.description}</p>
      )}

      <div className="about-grid">
        {currentFocus?.header && currentFocus?.description && (
          <div className="about-block">
            <h3>{currentFocus.header}</h3>
            <p>{currentFocus.description}</p>
          </div>
        )}
        {technicalStack?.header && technicalStack?.description && (
          <div className="about-block">
            <h3>{technicalStack.header}</h3>
            <p>{technicalStack.description}</p>
          </div>
        )}
        {mobileDevelopment?.header && mobileDevelopment?.description && (
          <div className="about-block">
            <h3>{mobileDevelopment.header}</h3>
            <p>{mobileDevelopment.description}</p>
          </div>
        )}
        {softSkills?.header && softSkills?.description && (
          <div className="about-block">
            <h3>{softSkills.header}</h3>
            <p>{softSkills.description}</p>
          </div>
        )}
      </div>
    </section>
  );
};

export default About;
