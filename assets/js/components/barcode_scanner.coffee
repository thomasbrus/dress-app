class @BarcodeScanner
  
  constructor: () ->
    @video = $('#barcode-scanner-video')
    @.bindHandlers()
    
  bindHandlers: ->
    @video.on 'ended', ->
      console.log 'Video ended'