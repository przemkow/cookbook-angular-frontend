(->
  angular.module 'cookbookFrontend'
    .controller 'RecipeController', ($scope, $rootScope, $stateParams, RecipeService) ->
      'ngInject'
      vm = @
      init = ->
        vm.recipe =
          name: null
          description: null
          preparation_time_in_min: null
        getRecipe($stateParams.id)

      #--------- implementation---------
      getRecipe = (id)->
        vm.recipe = RecipeService.get({id: id})

      init()
      return
)()
