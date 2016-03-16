angular.module('cookbookFrontend', ['ngAnimate', 'ngResource', 'ui.router', 'ui.bootstrap', 'ngCookies', 'textAngular', 'toastr']).config ($provide) ->
  $provide.decorator 'taOptions', [
    '$delegate'
    (taOptions) ->
      taOptions.toolbar = [
        ['h1','h2','h3','h4','h5','h6','p','pre','quote']
        ['bold','italics','underline','strikeThrough','ul','ol','redo','undo']
        ['justifyLeft','justifyCenter','justifyRight','indent','outdent']
      ]

      taOptions
  ]
