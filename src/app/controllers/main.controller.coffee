(->
  angular.module 'cookbookFrontend'
    .controller 'MainController', ($scope, $rootScope, AUTH_EVENTS, $timeout, AuthService) ->
      'ngInject'
      vm = @
      init = ->
        vm.logout = logout

      #--------- implementation---------
      logout = ->
        AuthService.logout().then ->
          $rootScope.$broadcast AUTH_EVENTS.logoutSuccess
          return

      init()
      return
)()
