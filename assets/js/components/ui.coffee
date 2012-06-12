class @UI
  
  constructor: () ->
    @.bindHandlers()
    
  bindHandlers: ->
    $(document).bind 'pageready ready', @.redraw
    $(window).bind 'resize', @.redraw

  redraw: ->
    $btn = $('.ui-btn-center')
    $btn.css('margin-left', ($btn.parent().outerWidth() - $btn.outerWidth()) / 2)