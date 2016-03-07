angular.module 'cookbookFrontend'
  .run ($log, $rootScope, AUTH_EVENTS, REG_EVENTS, AuthService) ->
    'ngInject'
    $log.debug 'runBlock end'

    $rootScope.currentUser = AuthService.currentUser()

    $rootScope.$on AUTH_EVENTS.loginSuccess, ->
      console.log "logged in"
      $rootScope.currentUser = AuthService.currentUser()
      return

    $rootScope.$on AUTH_EVENTS.logoutSuccess, ->
      console.log "logged out"
      $rootScope.currentUser = null
      return

    $rootScope.$on REG_EVENTS.regSuccess, ->
      console.log "registered"
      $rootScope.currentUser = AuthService.currentUser()
      return
