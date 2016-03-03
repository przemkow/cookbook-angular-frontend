(->
  angular.module 'cookbookFrontend'
    .controller 'MainController', ($scope, $timeout, AuthService) ->
      'ngInject'
      vm = @
      init = ->
        vm.currentUser = AuthService.currentUser()

      init()
      return
)()
