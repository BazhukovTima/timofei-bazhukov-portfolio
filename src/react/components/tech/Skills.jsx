import "../../styles/ResponsiveTech.css";
import info from "../../../data/info.json";

const Skills = () => (
  <div className="skills-section">
    {Object.entries(info.skills.skills)
      .filter(([key]) => key !== "description")
      .map(([key, category], index) => (
        <div key={index} className="skills-category">
          <h3 className="skills-category-title">{category.title}</h3>
          <div className="skills-grid">
            {category.skills.map((skill, idx) => (
              <div key={idx} className="skill-item">
                {skill}
              </div>
            ))}
          </div>
        </div>
      ))}
  </div>
);

export default Skills;
