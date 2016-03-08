(->
  angular.module 'cookbookFrontend'
    .controller 'UserProfileController', ($scope, $rootScope, $stateParams, UserService) ->
      'ngInject'
      vm = @
      init = () ->
        vm.userIdExist = true
        vm.user =
          id: ""
          email: ""
          first_name: ""
          last_name: ""
          about: ""
        getUser($stateParams.id)
        
      #--------- implementation---------
      getUser = (id) ->
        UserService.get(id).then (res) ->
          vm.user = res.data
        , ->
          vm.userIdExist = false

      init()
      return
)()
