angular.module 'cookbookFrontend'
  .run ($log, $rootScope, $http, AUTH_EVENTS, REG_EVENTS, AuthService, Session) ->
    'ngInject'
    $log.debug 'runBlock end'

    $http.defaults.headers.common.Authorization = Session.get().authToken

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
