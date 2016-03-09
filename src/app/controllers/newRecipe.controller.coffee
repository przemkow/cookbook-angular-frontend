(->
  angular.module 'cookbookFrontend'
    .controller 'NewRecipeController', ($scope, $rootScope, RecipeService) ->
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
        console.log credentials
        RecipeService.save(credentials).$promise.then (res) ->
          console.log res
        , (res) ->
          console.log res


      init()
      return
)()
