(->
  angular.module 'cookbookFrontend'
    .controller 'RegistrationController', ($scope, $rootScope, $state, UserService, AuthService, REG_EVENTS) ->
      'ngInject'
      vm = @
      init = ->
        vm.credentials =
          user:
            email: ''
            password: ''
            password_confirmation: ''
            first_name: ''
            last_name: ''
            about: ''
        vm.register = register

      #--------- implementation---------
      register = (credentials)->
        UserService.create(credentials).then (res) ->
          console.log "user registered from controller"
          $rootScope.$broadcast REG_EVENTS.regSuccess
          $state.transitionTo('app');
          return
        , (res) ->
          vm.errors = res.data.errors
          console.log vm.errors
          console.log "user not registered from controller"
          return
        return

      init()
      return
)()
