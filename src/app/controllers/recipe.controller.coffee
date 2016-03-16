(->
  angular.module 'cookbookFrontend'
    .controller 'RecipeController', ($scope, $rootScope, recipe, UserService) ->
      'ngInject'
      vm = @
      init = ->
        vm.recipe = recipe
        vm.user = null
        setUser()

      setUser = ->
        UserService.get(vm.recipe.user_id).then (res) ->
          vm.user =  res.data

      init()
      return
)()
