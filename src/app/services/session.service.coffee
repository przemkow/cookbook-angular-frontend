(->
  angular.module 'cookbookFrontend'
    .service 'Session', ->
      vm = @

      @create = (authToken, userId, userEmail, firstName, lastName) ->
        vm.authToken = authToken
        vm.userID = userId
        vm.userEmail = userEmail
        vm.firstName = firstName
        vm.lastName = lastName
        return

      @destroy = ->
        vm.authToken = null
        vm.userID = null
        vm.userEmail = null
        vm.firstName = null
        vm.lastName = null
        return

      @get = ->
        vm
        
      return
    return
)()
