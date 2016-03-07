(->
  angular.module 'cookbookFrontend'
    .controller 'LoginController', ($scope, $rootScope, AUTH_EVENTS, AuthService) ->
      'ngInject'
      vm = @
      init = () ->
        vm.credentials =
          email: ''
          password: ''
        vm.login = login

      #--------- implementation---------
      login = (credentials) ->
        AuthService.login(credentials).then ->
          $rootScope.$broadcast AUTH_EVENTS.loginSuccess
          return
        , ->
          $rootScope.$broadcast AUTH_EVENTS.loginFailed
          return
        return

      init()
      return
)()
