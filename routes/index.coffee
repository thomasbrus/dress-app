stores  = require '../fixtures/stores'
top_9   = require '../fixtures/top_9'

find_article_by_id = (id) ->
  for name, article of top_9
    return article if article.id is id
  null

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

  show: (req, res) ->    
    @size = req.params.size or 'm'
    @subpage = req.params.subpage or 'assortment'
    @article = find_article_by_id parseInt(req.params.id)    
    if @article
      try
        @num_assortments = Object.keys(@article.assortments[@size]).length
      catch e
        @num_assortments = 0        
      res.render 'top_9/article', {
        title: @article.title,
        article: @article,
        num_assortments: @num_assortments,
        subpage: @subpage,
        size: @size
      }
    else
      throw Error "Kan kledingstuk #{req.params.id} niet vinden."

exports.social =
  share_on_twitter: (req, res) ->
    @article = find_article_by_id parseInt(req.params.id)
    if @article
      res.render 'social/share_on_twitter'
    else
      throw Error "Kan kledingstuk #{req.params.id} niet vinden."

  share_on_facebook: (req, res) ->
    @article = find_article_by_id parseInt(req.params.id)
    if @article
      res.render 'social/share_on_facebook'
    else
      throw Error "Kan kledingstuk #{req.params.id} niet vinden."

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