(->
  angular.module 'cookbookFrontend'
    .controller 'HeaderController', ($scope, $rootScope, AUTH_EVENTS, AuthService, Notification) ->
      'ngInject'
      vm = @
      init = () ->
        vm.logout = logout

      #--------- implementation---------
      logout = ->
        AuthService.logout().then ->
          $rootScope.$broadcast AUTH_EVENTS.logoutSuccess
          Notification.info 'See you soon!'
          return

      init()
      return
)()
