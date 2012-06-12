stores  = require '../fixtures/stores'
top_9   = require '../fixtures/top_9'

exports.index = (req, res) ->
  res.render 'index', title: 'Startpagina'
    
exports.top_9 =
  index: (req, res) ->
    @top_9 = [
      top_9.johnboy_iii, top_9.campagnolo, top_9.june_camp,
      top_9.esprit, top_9.bugatti, top_9.humor,
      top_9.temaru, top_9.spray, top_9.tiki
    ]
    res.render 'top_9', title: 'Top 9', top_9: @top_9

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