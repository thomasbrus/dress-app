#= require_tree ./components

$(document).bind 'pageinit', ->

  switch window.location.pathname
    when '/'
      new BarcodeScanner()
  
  new UI()