module.exports = function(grunt) {

    grunt.initConfig({
        connect: {
            options: {
                base: './Slides/',
                open: true,
                hostname: 'localhost',
                port: 9009,
            },
            server: {},
            keepalive: {
                options: { keepalive: true },
            },
        },
        watch: {
            options: {
                livereload: true
            },
            content: {
                files: 'Slides/*.md'
            },
            assets: {
                files: 'Slides/ressources/**, !Slides/ressources/exemples/**'
            },
            theme: {
                files: 'Slides/reveal/theme-zenika/**'
            },
            reveal: {
                files: 'Slides/reveal/reveal.js/**'
            },
            index: {
                files: 'Slides/index.html'
            },
            tp: {
                files: 'tp/Cahier.md',
                tasks: ['markdownpdf'],
                options: {
                  livereload: false
                }
            },
            gruntfile: {
                files: 'Gruntfile.js',
                tasks: ['markdownpdf']
            }
        },
        markdownpdf: {
            all: {
                src: 'tp/Cahier.md',
                dest: 'tp/',
                options: {
                    cssPath: 'tp/github.css'
                }
            },
            options: {
                cssPath: 'tp/github.css'
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-connect');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-markdown-pdf');
    grunt.registerTask('default', ['connect:server', 'watch']);

};
