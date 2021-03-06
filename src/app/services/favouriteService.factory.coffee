(->
  angular.module 'cookbookFrontend'
  .factory 'FavouriteService', ($resource, baseURL, Session) ->
    'ngInject'
    $resource(baseURL+ "/users/:user_id/favourites/:id", {user_id:'@user_id'},
    'query':
      method: 'GET'
      isArray: true
      headers : Authorization: Session.get().authToken
    'save':
      method: 'POST'
      isArray: true
      headers : Authorization: Session.get().authToken
    'remove':
      method: 'DELETE'
      isArray: true
      headers : Authorization: Session.get().authToken
    'delete':
      method: 'DELETE'
      isArray: true
      headers : Authorization: Session.get().authToken
    )
  return
)()
