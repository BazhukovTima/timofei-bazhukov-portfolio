import "../styles/colors.css";
import "../styles/ResponsiveTech.css";
import Skills from '../components/tech/Skills';

const Tech = ({ info }) => {
  const skillsData = info?.skills?.skills;
  const description = info?.skills?.description;

  if (!skillsData && !description) return null;

  return (
    <section id="tech" className="tech-section">
      <div className="tech-background" />
      <h2 className="tech-title">Technologies and Frameworks</h2>
      {description && <p className="tech-intro">{description}</p>}
      {skillsData && (
        <div className="tech-grid">
          <Skills skills={skillsData} />
        </div>
      )}
    </section>
  );
};

export default Tech;
