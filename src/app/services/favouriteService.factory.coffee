(->
  angular.module 'cookbookFrontend'
  .factory 'FavouriteService', ($resource, baseURL, Session) ->
    'ngInject'
    $resource(baseURL+ "/users/:user_id/favourites", null,
    'query':
      method: 'GET'
      isArray: true
      headers : Authorization: Session.get().authToken
    'save':
      method: 'POST'
      headers : Authorization: Session.get().authToken
    'remove':
      method: 'DELETE'
      headers : Authorization: Session.get().authToken
    'delete':
      method: 'DELETE'
      headers : Authorization: Session.get().authToken
    )
  return
)()
