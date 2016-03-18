(->
  angular.module 'cookbookFrontend'
    .controller 'LoginController', ($scope, $rootScope, $state, AUTH_EVENTS, AuthService, Notification) ->
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
          $state.transitionTo('app')
          Notification.info {message: 'Logged in successfully!', replaceMessage: true}
          return
        , (res) ->
          Notification.error({message: res.data.errors, replaceMessage: true})
          $rootScope.$broadcast AUTH_EVENTS.loginFailed
          return
        return

      init()
      return
)()
