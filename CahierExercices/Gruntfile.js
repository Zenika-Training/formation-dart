module.exports = function(grunt) {

    grunt.registerTask("markdownpdf", function(){
        var done = this.async();

        var markdownpdf = require("markdown-pdf");
        var cssPath = __dirname + "/resources/github.css";
        var pdfPath = "../PDF/Cahier.pdf";

        console.log("Using CSS file", cssPath);

        markdownpdf({ cssPath: cssPath })
            .from("Cahier.md")
            .to(pdfPath, 
                function (v) {
                console.log("PDF généré: " + pdfPath);
                done();
            });
    });

    grunt.registerTask("default", "markdownpdf");
};