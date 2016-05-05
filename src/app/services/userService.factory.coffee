(->
  angular.module 'cookbookFrontend'
  .factory 'UserService', ($http, baseURL, Session) ->
    'ngInject'

    create: (credentials) ->
      return $http.post(baseURL + "/users", credentials).then (res) ->
        Session.create res.data.auth_token, res.data.id, res.data.email, res.data.fist_name, res.data.last_name

    get: (id) ->
      return $http.get(baseURL + "/users/" + id)


    update: (credentials) ->
      return

    destroy: (credentials) ->
      return

    getRecipes: (id) ->
      return $http.get(baseURL + "/users/" + id + "/recipes")

  return
)()
