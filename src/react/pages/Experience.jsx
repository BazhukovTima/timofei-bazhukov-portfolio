import { FaBuilding, FaTools, FaFileAlt } from "react-icons/fa";
import "../styles/colors.css";
import "../styles/ResponsiveExperience.css";

const Experience = ({ info }) => {
  const projects = info?.experience?.projects;
  const overview = info?.experience?.overview;

  if (!info?.experience) return null;

  return (
    <div className="experience-page">
      <section id="experience" className="experience-section">
        <h2 className="experience-title">Experience</h2>

        {overview && <p className="experience-intro">{overview}</p>}

        <div className="experience-grid">
          {projects &&
            Object.entries(projects).map(([projectName, projectData]) => (
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
