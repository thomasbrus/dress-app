exports.index = (req, res) ->
  res.render 'index', { title: 'Startpagina', homepage: true }
    
exports.top_9 =
  index: (req, res) ->
    res.render 'top_9', { title: 'Top 9' }

exports.stores = 
  index: (req, res) ->
    res.render 'stores', { title: 'Winkelinfo' }

exports.seasons =
  index: (req, res) ->
   res.render 'seasons', { title: 'Kerstkleding' }

exports.barcode_scanner =
  index: (req, res) ->
    res.render 'barcode_scanner', { title: 'Scan een barcode' }