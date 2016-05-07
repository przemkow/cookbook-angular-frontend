angular.module 'cookbookFrontend'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'app',
        url: '/'
        views:
          'header':
            templateUrl: 'app/templates/header.html'
            controller: 'HeaderController'
            controllerAs: 'headerVm'
          'content':
            templateUrl: 'app/templates/main.html'
            controller: 'MainController'
            controllerAs: 'mainVm'
            resolve:
              recipes: ($stateParams, RecipeService) ->
                'ngInject'
                RecipeService.query()
      .state 'app.login',
        url: 'login'
        views:
          'content@':
            templateUrl: 'app/templates/loginForm.html'
            controller: 'LoginController'
            controllerAs: 'loginVm'
      .state 'app.register',
        url: 'register'
        views:
          'content@':
            templateUrl: 'app/templates/registrationForm.html'
            controller: 'RegistrationController'
            controllerAs: 'registrationVm'
      .state 'app.register.email',
          templateUrl: 'app/templates/registration-form-partials/form-email.html'
      .state 'app.register.about',
          templateUrl: 'app/templates/registration-form-partials/form-about.html',
      .state 'app.register.password',
          templateUrl: 'app/templates/registration-form-partials/form-password.html'

      .state 'app.user',
        url: 'users/{user_id:int}'
        views:
          'content@':
            templateUrl: 'app/templates/user.html'
            controller: 'UserProfileController'
            controllerAs: 'userVm'
            resolve:
              user: ($stateParams, UserService) ->
                'ngInject'
                UserService.get($stateParams.user_id).then (res) ->
                  return res.data
      .state 'app.user.favourites',
        url: '/favourites'
        views:
          'content@':
            templateUrl: 'app/templates/favourites.html'
            controller: 'FavouritesController'
            controllerAs: 'favouritesVm'
            resolve:
              favourites: ($stateParams, FavouriteService) ->
                'ngInject'
                FavouriteService.query({user_id: $stateParams.user_id}).$promise
      .state 'app.user.myRecipes',
        url: '/myRecipes'
        views:
          'content@':
            templateUrl: 'app/templates/myRecipes.html'
            controller: 'MyRecipesController'
            controllerAs: 'myRecipesVm'
            resolve:
              myRecipes: ($rootScope, UserService) ->
                UserService.getRecipes($rootScope.currentUser.id).then (res) ->
                  return res.data



      .state 'app.recipe',
        url: 'recipes/{id:int}'
        views:
          'content@':
            templateUrl: 'app/templates/recipe.show.html'
            controller: 'RecipeController'
            controllerAs: 'recipeVm'
            resolve:
              recipe: ($stateParams, RecipeService) ->
                'ngInject'
                RecipeService.get({id: $stateParams.id}).$promise
      .state 'app.new_recipe',
        url: 'recipes/new'
        views:
          'content@':
            templateUrl: 'app/templates/recipe.new.html'
            controller: 'NewRecipeController'
            controllerAs: 'newRecipeVm'


    $urlRouterProvider.otherwise '/'
