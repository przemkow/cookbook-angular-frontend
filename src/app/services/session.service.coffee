(->
  angular.module 'cookbookFrontend'
    .service 'Session', ($cookies) ->
      'ngInject'
      vm = @
      vm.user =
        authToken: null
        id: null
        email: null
        first_name: null
        last_name: null

      init = () ->
        console.log "Session init has been called"
        vm.user = $cookies.getObject("currentUser") || {}

      @create = (authToken, userId, userEmail, firstName, lastName) ->
        vm.user.authToken = authToken
        vm.user.id = userId
        vm.user.email = userEmail
        vm.user.first_name = firstName
        vm.user.last_name = lastName
        $cookies.putObject("currentUser", vm.user)
        console.log "object has been added to cookies"
        return

      @destroy = ->
        vm.user.authToken = null
        vm.user.id = null
        vm.user.email = null
        vm.user.first_name = null
        vm.user.last_name = null
        $cookies.remove("currentUser")
        console.log "object has been deleted from cookies"
        return

      @get = ->
        vm.user

      init()
      return
    return
)()
