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
    $urlRouterProvider.otherwise '/'
