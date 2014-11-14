// Run with:
// > npm install && node convertToPdf.js

var markdownpdf = require("markdown-pdf");

var cssPath = __dirname + '/resources/github.css';

console.log('Using CSS file', cssPath);

markdownpdf({ cssPath: cssPath })
  .from("Cahier.md")
  .to("../PDF/Cahier.pdf", function () {
    console.log("PDF généré: Cahier.pdf");
  });
