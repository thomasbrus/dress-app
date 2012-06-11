class @BarcodeScanner
  
  constructor: () ->
    @.bindHandlers()
    
  bindHandlers: ->
    $('.camera-btn').toggle =>
      console.log 'Play video'
      @.playVideo()
    , =>
      @.pauseVideo()
      
  playVideo: ->
    $('#barcode-scanner-video')[0].play()
        
  pauseVideo: ->
    $('#barcode-scanner-video')[0].pause()