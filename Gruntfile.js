module.exports = function(grunt){

  grunt.task.loadNpmTasks("grunt-merge-json")

  grunt.initConfig({
    "merge-json": {
      "en": {
        src: [ "json/*.json" ],
        dest: "site/recipes.js"
      }
    }
  });

}
