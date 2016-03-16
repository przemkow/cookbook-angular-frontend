(->
  angular.module 'cookbookFrontend'
    .controller 'FavouritesController', ($scope, $rootScope, favourites, UserService) ->
      'ngInject'
      vm = @
      init = () ->
        vm.favourites = favourites
        setUser()

      setUser = ->
        console.log vm.favourites
        for favourite in vm.favourites
          UserService.get(favourite.user_id).then (res) ->
            favourite.user =  res.data
        console.log vm.favourites

      init()
      return
)()
