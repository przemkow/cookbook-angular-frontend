(->
  angular.module 'cookbookFrontend'
    .controller 'MainController', ($scope, $rootScope, AUTH_EVENTS, $timeout, AuthService, recipes, Notification) ->
      'ngInject'
      vm = @
      init = ->
        vm.logout = logout
        vm.recipes = recipes

      #--------- implementation---------
      logout = ->
        AuthService.logout().then ->
          $rootScope.$broadcast AUTH_EVENTS.logoutSuccess
          console.log "logged out"
          Notification.info 'See you soon!'
          return

      init()
      return
)()
