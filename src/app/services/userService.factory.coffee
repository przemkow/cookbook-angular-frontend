(->
  angular.module 'cookbookFrontend'
  .factory 'UserService', ($http, baseURL) ->
    'ngInject'

    create: (credentials) ->
      return $http.post(baseURL + "/users", credentials)
      
    show: (credentials) ->
      return

    update: (credentials) ->
      return

    destroy: (credentials) ->
      return

  return
)()
