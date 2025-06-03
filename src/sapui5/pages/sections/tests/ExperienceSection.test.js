import QUnit from "qunit";
import createExperienceSection from "../ExperienceSection.js";

QUnit.module("createExperienceSection", () => {
  const sapMock = {
    m: {
      Label: class {
        constructor(params) { this.params = params; }
      },
      ObjectStatus: class {
        constructor(params) { this.params = params; }
      },
      Text: class {
        constructor(params) { this.params = params; }
      },
      Panel: class {
        constructor(params) { this.params = params; }
        addStyleClass() { return this; }
      },
      VBox: class {
        constructor(params) { this.params = params; }
        addStyleClass() { return this; }
      }
    },
    uxap: {
      ObjectPageSection: class {
        constructor(params) { this.params = params; }
      },
      ObjectPageSubSection: class {
        constructor(params) { this.params = params; }
      }
    },
    ui: {
      layout: {
        VerticalLayout: class {
          constructor(params) { this.params = params; }
          addStyleClass() { return this; }
        },
        Grid: class {
          constructor(params) { this.params = params; }
        }
      }
    }
  };

  const validInfo = {
    experience: {
      overview: "Summary of experience",
      projects: {
        "Project A": {
          role: "Developer",
          company: "Company A",
          period: "2020 - Present",
          details: "Worked on X, Y, Z",
          technologies: "JS, SAPUI5"
        },
        "Project B": {
          role: "Lead",
          company: "Company B",
          period: "2018 - 2020",
          details: "Led team on ABC"
        }
      }
    }
  };

  QUnit.test("should create section with correct title and overview", assert => {
    const section = createExperienceSection(sapMock, validInfo);
    assert.ok(section);
    assert.equal(section.params.title, "Experience");
    const vbox = section.params.subSections[0].params.blocks[0].params.items[0];
    assert.equal(vbox.params.text, "Summary of experience");
  });

  QUnit.test("should create correct number of project panels", assert => {
    const section = createExperienceSection(sapMock, validInfo);
    const projectGrid = section.params.subSections[0].params.blocks[0].params.items[2];
    assert.equal(projectGrid.params.content.length, 2, "Two projects rendered");
  });

  QUnit.test("should throw if info.experience is missing", assert => {
    assert.throws(() => createExperienceSection(sapMock, {}), /Missing required parameters/);
  });

  QUnit.test("should handle project without technologies", assert => {
    const info = JSON.parse(JSON.stringify(validInfo));
    delete info.experience.projects["Project A"].technologies;
    const section = createExperienceSection(sapMock, info);
    const projectGrid = section.params.subSections[0].params.blocks[0].params.items[2];
    assert.equal(projectGrid.params.content.length, 2, "Two projects rendered even without technologies");
  });

  QUnit.test("should handle empty projects gracefully", assert => {
    const info = { experience: { overview: "No projects", projects: {} } };
    const section = createExperienceSection(sapMock, info);
    const projectGrid = section.params.subSections[0].params.blocks[0].params.items[2];
    assert.equal(projectGrid.params.content.length, 0, "No projects rendered");
  });
});
