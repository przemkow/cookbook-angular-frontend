angular.module 'cookbookFrontend'
  .directive 'ngReallyClick', [ ->
    {
      restrict: 'A'
      link: (scope, element, attrs) ->
        element.bind 'click', ->
          message = attrs.ngReallyMessage
          if message and confirm(message)
            scope.$apply attrs.ngReallyClick
          return
        return

    }
   ]
