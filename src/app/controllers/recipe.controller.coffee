(->
  angular.module 'cookbookFrontend'
    .controller 'RecipeController', ($scope, $rootScope, recipe, UserService, FavouriteService, Notification) ->
      'ngInject'
      vm = @
      init = ->
        vm.recipe = recipe
        vm.user = null
        setUser()
        vm.addToFavourites = addToFavourites

      setUser = ->
        UserService.get(vm.recipe.user_id).then (res) ->
          vm.user =  res.data

      addToFavourites = ->
        credentials =
          user_id: $rootScope.currentUser.id
          favourite:
            recipe_id: vm.recipe.id

        FavouriteService.save(credentials, (res) ->
          console.log res
          Notification.info 'Recipe added to favourites!'
        , (res) ->
          console.log res
          Notification.error 'Recipe is already in your favourites' if res.status == 406
        )

      init()
      return
)()
