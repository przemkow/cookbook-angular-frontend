(->
  angular.module 'cookbookFrontend'
    .controller 'MyRecipesController', ($scope, $rootScope, UserService) ->
      'ngInject'
      vm = @
      init = () ->
        vm.myRecipes = []
        UserService.getRecipes($rootScope.currentUser.id).then (res) ->
          vm.myRecipes = res.data

      init()
      return
)()
