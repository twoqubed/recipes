module.exports = function(grunt){

  grunt.task.loadNpmTasks("grunt-merge-json")

  grunt.initConfig({
    "merge-json": {
      "en": {
        src: [ "public/js/*.json" ],
        dest: "site/js/recipes.json"
      }
    }
  });

}
