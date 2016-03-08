(->
  angular.module 'cookbookFrontend'
    .controller 'RecipeController', ($scope, $rootScope, recipe) ->
      'ngInject'
      vm = @
      init = ->
        vm.recipe = recipe

      init()
      return
)()
