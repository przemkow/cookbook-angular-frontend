(->
  angular.module 'cookbookFrontend'
    .controller 'FavouritesController', ($scope, $rootScope, favourites, UserService) ->
      'ngInject'
      vm = @
      init = () ->
        vm.favourites = favourites
        setUser()

      setUser = ->
        vm.favourites.map (favourite)->
          UserService.get(favourite.user_id).then (res) ->
            favourite.user =  res.data

      init()
      return
)()
