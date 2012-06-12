class @BarcodeScanner
  
  constructor: () ->
    @.bindHandlers()
    
  bindHandlers: ->    
    $('#barcode-scanner-video').bind 'timeupdate', (e) =>
      if e.target.currentTime >= 8
        $.mobile.changePage '/seasons'
        e.target.currentTime = 0