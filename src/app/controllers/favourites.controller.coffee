(->
  angular.module 'cookbookFrontend'
    .controller 'FavouritesController', ($scope, $rootScope, favourites) ->
      'ngInject'
      vm = @
      init = () ->
        vm.favourites = favourites

      init()
      return
)()
