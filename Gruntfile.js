module.exports = function(grunt){

  require('load-grunt-tasks')(grunt);
  
  grunt.initConfig({
    "merge-json": {
      "en": {
        src: [ "json/*.json" ],
        dest: "site/recipes/recipes.json"
      }
    }
  });

}
