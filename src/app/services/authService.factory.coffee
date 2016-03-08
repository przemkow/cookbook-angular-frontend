(->
  angular.module 'cookbookFrontend'
  .factory 'AuthService', ($http, Session, baseURL) ->
    'ngInject'

    currentUser: ->
      if angular.equals(null, Session.get().authToken)
        return null
      else
        return Session.get()

    login: (credentials) ->
      return $http.post(baseURL + "/sessions", credentials).then (res) ->
        console.log res
        # @create = (authToken, userId, userEmail, firstName, lastName) ->
        Session.create res.data.auth_token, res.data.id, res.data.email, res.data.fist_name, res.data.last_name

    logout: ->
      console.log "logout"
      credentials =
        'Authorization': Session.get().authToken
      return $http.delete(baseURL + "/sessions/" + Session.get().authToken, credentials).then (res) ->
        Session.destroy()
        console.log res
        return

    isLoggedIn: ->
      return !!Session.userId

  return
)()
