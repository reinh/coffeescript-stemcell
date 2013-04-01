module.exports = (grunt) ->
  pkg = grunt.file.readJSON('package.json')
  grunt.initConfig
    pkg: pkg

    watch:
      coffee:
        files: ['coffee/**/*']
        tasks: 'coffee'
      stylus:
        files: ['stylus/*']
        tasks: 'stylus'
      jasmine:
        files: ['spec/**/*.coffee', 'coffee/**/*.coffee']
        tasks: 'spec'

    coffee:
      compile:
        options: { join: true }
        files: [{
          'app/js/app.js': 'coffee/app.coffee',
          'app/js/lib.js': 'coffee/lib/**/*.coffee'
        },
        {
          expand: true
          dest: 'app/spec/'
          cwd: 'spec/'
          src: '**/*.coffee'
          ext: '.js'
        }]

    coffeelint:
      source: 'coffee/**/*.coffee'
      grunt: 'Gruntfile.coffee'

    stylus:
      compile:
        files:
          'app/css/app.css': 'stylus/app.styl'

    jasmine:
      src: 'app/js/lib.js'
      options:
        specs: 'app/spec/**/*_spec.js'

  # Dependencies
  for name of pkg.devDependencies when name.substring(0, 6) is 'grunt-'
    grunt.loadNpmTasks name

  grunt.registerTask 'build',
                     'Build CoffeeScript and Stylus',
                     ['coffee', 'stylus']

  grunt.registerTask 'spec',
                     'Run the Jasmine spec suite',
                     ['coffee', 'jasmine']

  grunt.registerTask 'default', 'build'
