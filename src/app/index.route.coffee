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
            templateUrl: 'app/main/main.html'
            controller: 'MainController'
            controllerAs: 'main'

    $urlRouterProvider.otherwise '/'
