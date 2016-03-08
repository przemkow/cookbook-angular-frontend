(->
  angular.module 'cookbookFrontend'
    .controller 'UserProfileController', ($scope, $rootScope, user) ->
      'ngInject'
      vm = @
      init = () ->
        # user fields:
        # vm.user =
        #   id: ""
        #   email: ""
        #   first_name: ""
        #   last_name: ""
        #   about: ""
        vm.user = user

      #--------- implementation---------

      init()
      return
)()
