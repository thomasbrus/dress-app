#= require_tree ./components

$(document).bind 'pageinit', () ->

  switch window.location.pathname
    when '/barcode-scanner'
      new BarcodeScanner()
    else
      new UI()