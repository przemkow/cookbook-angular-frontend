(->
  angular.module 'cookbookFrontend'
    .service 'Session', ($cookies) ->
      'ngInject'
      vm = @
      vm.user = {}

      init = () ->
        console.log "Session init has been called"
        vm.user = $cookies.getObject("currentUser") || {}

      @create = (authToken, userId, userEmail, firstName, lastName) ->
        vm.user.authToken = authToken
        vm.user.userID = userId
        vm.user.userEmail = userEmail
        vm.user.firstName = firstName
        vm.user.lastName = lastName
        $cookies.putObject("currentUser", vm.user)
        console.log "object has been added to cookies"
        return

      @destroy = ->
        vm.user.authToken = null
        vm.user.userID = null
        vm.user.userEmail = null
        vm.user.firstName = null
        vm.user.lastName = null
        $cookies.remove("currentUser")
        console.log "object has been deleted from cookies"
        return

      @get = ->
        vm.user

      init()
      return
    return
)()
