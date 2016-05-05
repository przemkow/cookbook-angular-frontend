angular.module 'cookbookFrontend'
  .config ($logProvider, toastrConfig, $httpProvider) ->
    'ngInject'
    # Enable log
    $logProvider.debugEnabled true
    # Set options third-party lib
    toastrConfig.allowHtml = true
    toastrConfig.timeOut = 3000
    toastrConfig.positionClass = 'toast-top-right'
    toastrConfig.preventDuplicates = true
    toastrConfig.progressBar = true



  .config ($provide) ->
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

  .config (NotificationProvider) ->
    NotificationProvider.setOptions
      delay: 2000
      startTop: 10
      startRight: 10
      verticalSpacing: 20
      horizontalSpacing: 20
      positionX: 'right'
      positionY: 'bottom'
    return
