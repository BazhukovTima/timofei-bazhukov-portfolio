import React from "react";
import "../styles/colors.css";
import "../styles/About.css";
import info from "../data/info.json";

const About = () => (
  <section id="about" className="about-section">
    <div className="about-background" />
    <h2 className="about-title">{info.about.header}</h2>

    <p className="about-intro">{info.about.expertise.description}</p>

    <div className="about-grid">
      <div className="about-block">
        <h3>{info.about.currentFocus.header}</h3>
        <p>{info.about.currentFocus.description}</p>
      </div>
      <div className="about-block">
        <h3>{info.about.technicalStack.header}</h3>
        <p>{info.about.technicalStack.description}</p>
      </div>
      <div className="about-block">
        <h3>{info.about.mobileDevelopment.header}</h3>
        <p>{info.about.mobileDevelopment.description}</p>
      </div>
      <div className="about-block">
        <h3>{info.about.softSkills.header}</h3>
        <p>{info.about.softSkills.description}</p>
      </div>
    </div>
  </section>
);

export default About;
