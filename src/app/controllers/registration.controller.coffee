(->
  angular.module 'cookbookFrontend'
    .controller 'RegistrationController', ($scope, $rootScope, $state, UserService, AuthService, REG_EVENTS, registrationSliderState) ->
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
        vm.slideAnimations = "slideInRight slideOutLeft"
        vm.slideView = slideView
        vm.previousOption = previousOption
        vm.nextOption = nextOption

      #--------- implementation---------
      register = (credentials)->
        UserService.create(credentials).then (res) ->
          console.log "user registered from controller"
          $rootScope.$broadcast REG_EVENTS.regSuccess
          $state.transitionTo('app')
          return
        , (res) ->
          vm.errors = res.data.errors
          console.log vm.errors
          console.log "user not registered from controller"
          return
        return

      slideView = (index) ->
        if registrationSliderState.getViewIndex() > index
          vm.previousOption()
        else
          vm.nextOption()
        registrationSliderState.setViewIndex index

      previousOption = (index) ->
        vm.slideAnimations = "slideInLeft slideOutRight"
        registrationSliderState.setViewIndex(index)

      nextOption = (index) ->
        vm.slideAnimations = "slideInRight slideOutLeft"
        registrationSliderState.setViewIndex(index)

      init()
      return
)()
