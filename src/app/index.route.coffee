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
      .state 'app.users',
        url: 'users/{id:int}'
        views:
          'content@':
            templateUrl: 'app/templates/user.html'
            controller: 'UserProfileController'
            controllerAs: 'userVm'
      .state 'app.recipes',
        url: 'recipes/{id:int}'
        views:
          'content@':
            templateUrl: 'app/templates/recipe.html'
            controller: 'RecipeController'
            controllerAs: 'recipeVm'

    $urlRouterProvider.otherwise '/'
