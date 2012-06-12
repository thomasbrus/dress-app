#= require_tree ./components

$(document).bind 'pageinit pagechange ready', ->

  switch window.location.pathname
    when '/barcode-scanner'
      new BarcodeScanner()
  
  new UI()