import QUnit from "qunit";
import createHeaderContent from "../HeaderContent.js";

QUnit.module("createHeaderContent", () => {
  const sapMock = {
    m: {
      Avatar: class {
        constructor(params) { this.params = params; }
      },
      ObjectStatus: class {
        constructor(params) { this.params = params; }
        addStyleClass() { return this; }
      },
      Link: class {
        constructor(params) { this.params = params; }
        addStyleClass() { return this; }
      },
      HBox: class {
        constructor(params) { this.params = params; }
      },
      AvatarColor: {
        TileIcon: "Accent6"
      }
    },
    ui: {
      layout: {
        VerticalLayout: class {
          constructor(params) { this.params = params; }
        },
        BlockLayout: class {
          constructor(params) { this.params = params; }
        },
        BlockLayoutRow: class {
          constructor(params) { this.params = params; }
        },
        BlockLayoutCell: class {
          constructor(params) { this.params = params; }
        },
      }
    }
  };

  const validInfo = {
    name: "John Doe",
    role: "Developer",
    location: "New York",
    description: "Experienced SAP developer",
    social: [
      { platform: "GitHub", url: "https://github.com/johndoe" },
      { platform: "LinkedIn", url: "https://linkedin.com/in/johndoe" },
    ],
  };

  QUnit.test("should create layout with correct name and profile image", assert => {
    const profileUrl = "profile.jpg";
    const layout = createHeaderContent(sapMock, validInfo, profileUrl);
    assert.ok(layout);
    const blockLayoutRow = layout.params.content[0].params.content[0];
    const firstCell = blockLayoutRow.params.content[0];
    const secondCell = blockLayoutRow.params.content[1];
    // Проверяем аватарку
    assert.equal(firstCell.params.content[0].params.src, profileUrl);
    // Проверяем имя
    assert.equal(secondCell.params.title, "John Doe");
  });

  QUnit.test("should render correct number of social links", assert => {
    const layout = createHeaderContent(sapMock, validInfo, "");
    const socialHBox = layout.params.content[0].params.content[0].params.content[1].params.content[3];
    // Первый объект - ObjectStatus chain-link, дальше 2 ссылки
    assert.equal(socialHBox.params.items.length, 3);
  });

  QUnit.test("should throw if sap or info missing", assert => {
    assert.throws(() => createHeaderContent(null, validInfo, ""), /Missing required parameters/);
    assert.throws(() => createHeaderContent(sapMock, null, ""), /Missing required parameters/);
  });

  QUnit.test("should handle empty social array gracefully", assert => {
    const info = { ...validInfo, social: [] };
    const layout = createHeaderContent(sapMock, info, "");
    const socialHBox = layout.params.content[0].params.content[0].params.content[1].params.content[3];
    // Первый объект - ObjectStatus chain-link, соцсетей нет, должно быть 1 элемент
    assert.equal(socialHBox.params.items.length, 1);
  });

  QUnit.test("should use default values if some fields are missing", assert => {
    const info = { name: "Jane" }; // role, location, description, social missing
    const layout = createHeaderContent(sapMock, info, "");
    const secondCell = layout.params.content[0].params.content[0].params.content[1];
    assert.equal(secondCell.params.title, "Jane");
    // Проверяем что соц сети не ломают
    const socialHBox = secondCell.params.content[3];
    assert.equal(socialHBox.params.items.length, 1); // только ObjectStatus chain-link
  });
});
