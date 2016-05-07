(->
  angular.module 'cookbookFrontend'
    .controller 'HeaderController', ($scope, $rootScope, AUTH_EVENTS, AuthService, Notification, $location) ->
      'ngInject'
      vm = @
      init = () ->
        vm.logout = logout
        vm.isActive = isActive

      #--------- implementation---------
      logout = ->
        AuthService.logout().then ->
          $rootScope.$broadcast AUTH_EVENTS.logoutSuccess
          Notification.info 'See you soon!'
          return

      isActive = (viewLocation) ->
        return viewLocation == $location.path().replace(/[\d]/,"*")

      init()
      return
)()
