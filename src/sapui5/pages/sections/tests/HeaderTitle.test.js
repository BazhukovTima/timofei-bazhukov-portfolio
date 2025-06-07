import QUnit from "qunit";
import createHeaderTitle from "../HeaderTitle.js";

QUnit.module("createHeaderTitle", () => {
  const sapMock = {
    uxap: {
      ObjectPageHeader: class {
        constructor(params) {
          this.params = params;
        }
      },
    },
  };

  QUnit.test("should create ObjectPageHeader with correct properties", (assert) => {
    const info = { name: "John Doe", role: "Developer" };
    const profile = "/path/to/profile.png";
    const header = createHeaderTitle(sapMock, info, profile);

    assert.ok(header instanceof sapMock.uxap.ObjectPageHeader, "Created instance");
    assert.equal(header.params.objectTitle, "John Doe", "Correct objectTitle");
    assert.equal(header.params.objectSubtitle, "Developer", "Correct objectSubtitle");
    assert.equal(header.params.objectImageURI, profile, "Correct objectImageURI");
  });

  QUnit.test("should throw if sap is missing", (assert) => {
    const info = { name: "John Doe", role: "Developer" };
    assert.throws(() => createHeaderTitle(null, info, ""), /Missing required parameters/, "Throws without sap");
  });

  QUnit.test("should throw if info is missing", (assert) => {
    assert.throws(() => createHeaderTitle(sapMock, null, ""), /Missing required parameters/, "Throws without info");
  });

  QUnit.test("should handle missing profile (undefined)", (assert) => {
    const info = { name: "John Doe", role: "Developer" };
    const header = createHeaderTitle(sapMock, info, undefined);
    assert.equal(header.params.objectImageURI, undefined, "Profile can be undefined");
  });

  QUnit.test("should handle missing name or role gracefully", (assert) => {
    const info = {};
    const header = createHeaderTitle(sapMock, info, "");
    assert.strictEqual(header.params.objectTitle, undefined, "Name missing");
    assert.strictEqual(header.params.objectSubtitle, undefined, "Role missing");
  });
});
