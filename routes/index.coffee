stores = require '../fixtures/stores'

exports.index = (req, res) ->
  res.render 'index', title: 'Startpagina'
    
exports.top_9 =
  index: (req, res) ->
    res.render 'top_9', title: 'Top 9'

exports.stores = 
  index: (req, res) ->
    @stores = [stores.c_and_a, stores.the_sting, stores.open32, stores.h_and_m]
    res.render 'stores', title: 'Winkelinfo', stores: @stores

exports.seasons =
  index: (req, res) ->
    res.render 'seasons', title: 'Kerstkleding'

exports.barcode_scanner =
  index: (req, res) ->
    res.render 'barcode_scanner', title: 'Scan een barcode'