(->
  angular.module 'cookbookFrontend'
    .controller 'MainController', ($scope, $rootScope, AUTH_EVENTS, $timeout, AuthService, recipes) ->
      'ngInject'
      vm = @
      init = ->
        vm.logout = logout
        vm.recipes = recipes

      #--------- implementation---------
      logout = ->
        AuthService.logout().then ->
          $rootScope.$broadcast AUTH_EVENTS.logoutSuccess
          return

      init()
      return
)()
