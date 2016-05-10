(->
  angular.module 'cookbookFrontend'
    .controller 'EditRecipeController', ($scope, $state, $stateParams, $rootScope, recipe, RecipeService) ->
      'ngInject'
      vm = @
      init = ->
        vm.credentials =
          recipe: recipe
          id: $stateParams.id
        vm.updateRecipe = updateRecipe


      #--------- implementation---------
      updateRecipe = (credentials)->
        console.log credentials
        RecipeService.update(credentials).$promise.then (res) ->
          console.log "OK"
          console.log res
          $state.go('app.recipe', {id: res.id}, {reload: true})

        , (res) ->
          console.log "ERROR"
          console.log res

      init()
      return
)()
