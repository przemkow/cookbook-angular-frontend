angular.module 'cookbookFrontend'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'app',
        url: '/'
        views:
          'header':
            templateUrl: 'app/templates/header.html'
          'content':
            templateUrl: 'app/templates/main.html'
            controller: 'MainController'
            controllerAs: 'main'
      .state 'app.login',
        url: 'login'
        views:
          'content@':
            templateUrl: 'app/templates/loginForm.html'
            controller: 'LoginController'
            controllerAs: 'login'

    $urlRouterProvider.otherwise '/'
