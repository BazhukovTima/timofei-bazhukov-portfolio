import QUnit from "qunit";
import createTechnologiesSection from "../TechnologiesSection.js";

QUnit.module("createTechnologiesSection", () => {
  const sapMock = {
    m: {
      FlexBox: class {
        constructor(params) {
          this.params = params;
          this.items = params.items || [];
          this.addStyleClass = () => this;
        }
      },
      FlexWrap: { Wrap: "Wrap" },
      FlexDirection: { Row: "Row" },
      Label: class {
        constructor(params) {
          this.text = params.text;
          this.addStyleClass = () => this;
        }
      },
      VBox: class {
        constructor(params) {
          this.items = params.items || [];
          this.height = params.height || "";
        }
      },
      Title: class {
        constructor(params) {
          this.text = params.text;
          this.level = params.level;
          this.addStyleClass = () => this;
        }
      },
      Text: class {
        constructor(params) {
          this.text = params.text;
          this.width = params.width;
          this.wrapping = params.wrapping;
        }
      },
    },
    ui: {
      layout: {
        GridData: class {
          constructor(params) {
            this.span = params.span;
          }
        },
        Grid: class {
          constructor(params) {
            this.defaultSpan = params.defaultSpan;
            this.content = params.content;
          }
        },
        VerticalLayout: class {
          constructor(params) {
            this.width = params.width;
            this.content = params.content;
          }
        },
      },
    },
    uxap: {
      ObjectPageSection: class {
        constructor(params) {
          this.title = params.title;
          this.subSections = params.subSections;
        }
      },
      ObjectPageSubSection: class {
        constructor(params) {
          this.blocks = params.blocks;
        }
      },
    },
  };

  QUnit.test("creates section with correct title", (assert) => {
    const info = {
      skills: {
        description: "Some description",
        skills: {
          frontend: {
            title: "Frontend",
            skills: ["React", "Vue"],
          },
          backend: {
            title: "Backend",
            skills: ["Node.js", "Express"],
          },
        },
      },
    };

    const section = createTechnologiesSection(sapMock, info);
    assert.ok(section instanceof sapMock.uxap.ObjectPageSection, "Created ObjectPageSection instance");
    assert.equal(section.title, "Technologies and Frameworks", "Correct section title");
  });

  QUnit.test("throws if sap or info.skills.skills missing", (assert) => {
    assert.throws(() => createTechnologiesSection(null, {}), /Missing required parameters/, "Throws without sap");
    assert.throws(() => createTechnologiesSection(sapMock, {}), /Missing required parameters/, "Throws without info.skills.skills");
  });

  QUnit.test("handles empty skills array", (assert) => {
    const info = {
      skills: {
        description: "Empty skills",
        skills: {
          emptyCategory: {
            title: "Empty Category",
            skills: [],
          },
        },
      },
    };
    const section = createTechnologiesSection(sapMock, info);
    assert.ok(section instanceof sapMock.uxap.ObjectPageSection, "Created section even with empty skills array");
  });

  QUnit.test("handles missing category title and skill names", (assert) => {
    const info = {
      skills: {
        description: "Missing titles and skills",
        skills: {
          cat1: {
            // title missing
            skills: [undefined, null, "ValidSkill"],
          },
        },
      },
    };
    const section = createTechnologiesSection(sapMock, info);
    assert.ok(section instanceof sapMock.uxap.ObjectPageSection, "Created section even with missing titles and skill names");
  });

  QUnit.test("renders description text correctly", (assert) => {
    const info = {
      skills: {
        description: "Description text here",
        skills: {
          category1: {
            title: "Category 1",
            skills: ["Skill1"],
          },
        },
      },
    };

    const section = createTechnologiesSection(sapMock, info);
    const subSection = section.subSections[0];
    const vLayout = subSection.blocks[0];
    const content = vLayout.content;

    assert.ok(content.some(c => c.text === "Description text here"), "Description text rendered");
  });
});
