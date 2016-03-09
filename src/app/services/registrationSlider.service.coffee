(->
  angular.module 'cookbookFrontend'
    .service 'registrationSliderState', () ->
      vm = @

      init = () ->
        vm.viewIndex = 1
        vm.getViewIndex = getViewIndex
        vm.setViewIndex = setViewIndex

      #--------- implementation---------
      getViewIndex = ->
        vm.viewIndex

      setViewIndex = (index) ->
        vm.viewIndex = index
        return

      init()
      return
    return
)()
