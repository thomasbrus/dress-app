class @UI
  
  constructor: () ->
    @.redraw()
    @.bindHandlers()
    
  bindHandlers: ->
    $(window).resize =>
      @.redraw()

  redraw: ->
    $btn = $('.ui-btn-center')
    $btn.css('margin-left', ($btn.parent().outerWidth() - $btn.outerWidth()) / 2)