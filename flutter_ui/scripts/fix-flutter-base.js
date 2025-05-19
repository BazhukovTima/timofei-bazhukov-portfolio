const fs = require("fs");
const path = require("path");

const indexPath = path.join(__dirname, "..", "build", "web", "index.html");

if (fs.existsSync(indexPath)) {
  let content = fs.readFileSync(indexPath, "utf8");
  content = content.replace(
    /<base href="\/">/,
    '<base href="/flutter/">'
  );
  fs.writeFileSync(indexPath, content, "utf8");
  console.log("✅ [fix-flutter-base] <base href> updated to /flutter/");
} else {
  console.error("❌ [fix-flutter-base] index.html not found:", indexPath);
}