(->
  angular.module 'cookbookFrontend'
    .controller 'MyRecipesController', ($scope, $rootScope, myRecipes, UserService) ->
      'ngInject'
      vm = @
      init = () ->
        vm.myRecipes = myRecipes
        setUser()

      setUser = ->
        vm.myRecipes.map (recipe)->
          UserService.get(recipe.user_id).then (res) ->
            recipe.user =  res.data

      init()
      return
)()
