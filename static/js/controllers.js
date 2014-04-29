var recipeApp = angular.module('recipeApp', []);

recipeApp.controller('RecipeController', ['$scope', '$http', function ($scope, $http) {
  $http.get('/recipes/recipes.json').success(function(data) {
    $scope.recipes = data
  });
}]);
