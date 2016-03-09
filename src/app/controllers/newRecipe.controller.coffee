(->
  angular.module 'cookbookFrontend'
    .controller 'NewRecipeController', ($scope, $state, $rootScope, RecipeService) ->
      'ngInject'
      vm = @
      init = ->
        vm.credentials =
          recipe:
            name: ""
            description: ""
            preparation_time_in_min: ""
        vm.createRecipe = createRecipe

      #--------- implementation---------
      createRecipe = (credentials)->
        RecipeService.save(credentials).$promise.then (res) ->
          console.log res
          $state.transitionTo('app.recipe', {id: res.id});
        , (res) ->
          console.log res


      init()
      return
)()
