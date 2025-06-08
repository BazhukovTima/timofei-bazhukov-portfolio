import QUnit from 'qunit';
import createAboutSection from '../AboutSection.js';

QUnit.module('createAboutSection', () => {
  const getValidInfo = () => ({
    about: {
      header: 'About Me',
      expertise: { description: 'Experienced developer' },
      currentFocus: { header: 'Focus', description: 'AI, SAPUI5' },
      technicalStack: { header: 'Stack', description: 'JS, ABAP' },
      mobileDevelopment: { header: 'Mobile', description: 'Flutter' },
      softSkills: { header: 'Soft Skills', description: 'Teamwork' },
    }
  });

  const getSapMock = () => ({
    m: {
      VBox: class {
        constructor(params) { this.params = params; }
        addStyleClass() { return this; }
      },
      Title: class {
        constructor(params) { this.params = params; }
        addStyleClass() { return this; }
      },
      Text: class {
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
        },
        Grid: class {
          constructor(params) { this.params = params; }
        },
        GridData: class {
          constructor(params) { this.params = params; }
        }
      }
    }
  });

  QUnit.test('should create section with correct title and subsections', assert => {
    const sap = getSapMock();
    const info = getValidInfo();
    const section = createAboutSection(sap, info);

    assert.ok(section);
    assert.equal(section.params.title, 'About Me');
    assert.ok(section.params.subSections.length > 0, 'Has subSections');
  });

  QUnit.test('should contain 4 Grid items (makeCell calls)', assert => {
    const sap = getSapMock();
    const info = getValidInfo();
    const section = createAboutSection(sap, info);

    const blocks = section.params.subSections[0].params.blocks;
    const grid = blocks[0].params.content[2]; // Grid is 3rd item
    assert.equal(grid.params.content.length, 4, 'Grid has 4 cells');
  });

  QUnit.test('should throw if info.about is missing', assert => {
    const sap = getSapMock();
    const info = {}; // Missing about
    assert.throws(
      () => createAboutSection(sap, info),
      /Missing required parameters: sap or info\.about/,
      'Throws on missing about'
    );
  });

  QUnit.test('should create section even if one cell header is undefined', assert => {
    const sap = getSapMock();
    const info = getValidInfo();
    delete info.about.currentFocus.header; // No header
    const section = createAboutSection(sap, info);
    assert.ok(section, 'Section still created');
  });

  QUnit.test('should create section even if description is empty', assert => {
    const sap = getSapMock();
    const info = getValidInfo();
    info.about.softSkills.description = '';
    const section = createAboutSection(sap, info);
    assert.ok(section, 'Section still created with empty description');
  });
});
