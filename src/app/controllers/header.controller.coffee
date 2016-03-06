(->
  angular.module 'cookbookFrontend'
    .controller 'HeaderController', ($scope, $rootScope, AUTH_EVENTS, AuthService) ->
      'ngInject'
      vm = @
      init = () ->
        vm.logout = logout

      #--------- implementation---------
      logout = ->
        AuthService.logout().then ->
          $rootScope.$broadcast AUTH_EVENTS.logoutSuccess
          return

      init()
      return
)()
