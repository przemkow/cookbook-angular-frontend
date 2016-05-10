(->
  angular.module 'cookbookFrontend'
    .controller 'RecipeController', ($scope, $rootScope, recipe, currentUserFavourites, UserService, FavouriteService, Notification) ->
      'ngInject'
      vm = @
      init = ->
        vm.recipe = recipe
        vm.user = null
        vm.currentUserFavourites = currentUserFavourites
        vm.isInFavourites = false
        vm.addToFavourites = addToFavourites
        vm.deleteFromFavourites = deleteFromFavourites
        setUser()
        checkFavourites()

      setUser = ->
        UserService.get(vm.recipe.user_id).then (res) ->
          vm.recipe.user =  res.data

      checkFavourites = ->
        currentUserFavouritesId = currentUserFavourites.map (a) ->
          return a.id
        vm.isInFavourites = vm.recipe.id in currentUserFavouritesId

      addToFavourites = ->
        credentials =
          user_id: $rootScope.currentUser.id
          favourite:
            recipe_id: vm.recipe.id

        FavouriteService.save(credentials, (res) ->
          console.log res
          Notification.info {message: 'Recipe added to favourites!', replaceMessage: true}
          vm.isInFavourites = true
        , (res) ->
          console.log res
          Notification.error {message: 'Recipe is already in your favourites', replaceMessage: true} if res.status == 406
          vm.isInFavourites = false
        )

      deleteFromFavourites = ->
        credentials =
          user_id: $rootScope.currentUser.id
          id: vm.recipe.id
        FavouriteService.delete(credentials, (res) ->
          console.log res
          Notification.warning {message: 'Recipe deleted from favourites!', replaceMessage: true}
          vm.isInFavourites = false
        , (res) ->
          console.log res
          Notification.error {message: 'Recipe is not in your favourites', replaceMessage: true} if res.status == 406
          vm.isInFavourites = true
        )

      init()
      return
)()
