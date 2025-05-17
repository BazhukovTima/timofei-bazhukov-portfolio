import React from "react";
import "./colors.css";
import "./Tech.css";
import Footer from './Footer';
import Skills from './Skills';
import info from "../../data/info.json";

const Tech = () => (
  <section id="tech" className="tech-section">
    <div className="tech-background" />
    <h2 className="tech-title">Technologies and Frameworks</h2>

    <p className="tech-intro">{info.skills.description}</p>

    <div className="tech-grid">
        <Skills />
    </div>
    <Footer fixed={true} />
  </section>
);

export default Tech;
