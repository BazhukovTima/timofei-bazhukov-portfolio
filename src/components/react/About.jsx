import React from "react";
import "./colors.css";
import "./About.css";
import Footer from './Footer';

import info from "../../data/info.json";

const About = () => (
  <section id="about" className="about-section">
    <div className="about-background" />
    <h2 className="about-title">About me</h2>

    <p className="about-intro">{info.about.expertise}</p>

    <div className="about-grid">
      <div className="about-block">
        <h3>Professional Focus</h3>
        <p>{info.about.currentFocus}</p>
      </div>
      <div className="about-block">
        <h3>Technical Expertise</h3>
        <p>{info.about.technicalStack}</p>
      </div>
      <div className="about-block">
        <h3>Cross-Platform Experience</h3>
        <p>{info.about.mobileDevelopment}</p>
      </div>
      <div className="about-block">
        <h3>Soft Skills & Strategy</h3>
        <p>{info.about.softSkills}</p>
      </div>
    </div>
    <Footer fixed={true} />
  </section>
);

export default About;
