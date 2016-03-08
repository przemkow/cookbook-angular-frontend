(->
  angular.module 'cookbookFrontend'
  .factory 'RecipeService', ($resource, baseURL, Session) ->
    'ngInject'
    $resource(baseURL+ "/recipes/:id", null,
    'update':
      method: 'PUT'
      headers : Authorization: Session.get().authToken
    'save':
      headers : Authorization: Session.get().authToken
    'remove':
      headers : Authorization: Session.get().authToken
    'delete':
      headers : Authorization: Session.get().authToken
    )
  return
)()
