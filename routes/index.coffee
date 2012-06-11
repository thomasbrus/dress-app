exports.index = (req, res) ->
  res.render 'index', { title: 'Startpagina', homepage: true }
    
exports.top_9 = (req, res) ->
  res.render 'top_9', { title: 'Top 9' }

exports.stores = (req, res) ->
  res.render 'stores', { title: 'Winkelinfo' }

exports.seasons = (req, res) ->
  res.render 'seasons', { title: 'Kerstkleding' }

exports.barcode_scanner = (req, res) ->
  res.render 'barcode_scanner', { title: 'Scan een barcode' }