(->
  angular.module 'cookbookFrontend'
  .factory 'RecipeService', ($resource, baseURL, Session) ->
    'ngInject'
    $resource(baseURL+ "/recipes/:id", null,
    'update':
      method: 'PATCH'
      headers : Authorization: Session.get().authToken
      params:
        id: "@id"
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
