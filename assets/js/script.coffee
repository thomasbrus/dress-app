#= require_tree ./components

$(document).bind 'pageinit pagechange ready', ->

  switch window.location.pathname
    when '/'
      new BarcodeScanner()
  
  new UI()