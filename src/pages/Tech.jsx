import React from "react";
import "../styles/colors.css";
import "../styles/Tech.css";
import Footer from '../components/common/Footer';
import Skills from '../components/tech/Skills';
import info from "../data/info.json";

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
