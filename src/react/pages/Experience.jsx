import { FaBuilding, FaTools, FaFileAlt } from "react-icons/fa";
import "../styles/colors.css";
import "../styles/ResponsiveExperience.css";
import info from "../../data/info.json";

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
              <div className="project-header">
                <h3 className="project-title">
                  {projectName} — {projectData.role}
                </h3>
              </div>

              <p className="project-company">
                <FaBuilding className="icon" />
                {projectData.company}
              </p>

              <p className="project-tech">
                <FaTools className="icon" />
                {projectData.technologies}
              </p>

              <p className="project-details">
                <FaFileAlt className="icon" />
                {projectData.details}
              </p>
            </div>
          ))}
        </div>
      </section>
    </div>
  );
};

export default Experience;
