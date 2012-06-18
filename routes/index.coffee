_         = require 'underscore'
stores    = require '../fixtures/stores'
articles  = require '../fixtures/articles'

find_article_by_category_and_id = (category, id) ->
  for name, article of articles[category]
    return article if article.id is id
  null

find_store_by_id = (id) ->
  for name, store of stores
    return store if store.id is id
  null

exports.index = (req, res) ->
  res.render 'index', title: 'Startpagina'
    
exports.articles =
  index: (req, res) ->
    if req.params.category in ['top-9', 'themed']
      @category = req.params.category
      @articles = _.values articles[category.replace '-', '_']
      res.render 'articles', title: 'Kleding', articles: @articles, category: @category
    else
      throw Error "De kledingcategorie #{req.params.category} bestaat niet"

  show: (req, res) ->  
    if req.params.category in ['top-9', 'themed']
      @category = req.params.category
      @article = find_article_by_category_and_id category.replace('-', '_'), parseInt(req.params.id)    
      @sub_page = req.params.subpage or 'assortment'
      @size = req.params.size or 'm'
      if @article      
        res.render 'articles/article', {
          title: @article.title,
          article: @article,
          sub_page: @sub_page,
          size: @size,
          category: @category
        }
      else
        throw Error "Kan kledingstuk #{req.params.id} niet vinden."
    else
      throw Error "De kledingcategorie #{req.params.category} bestaat niet"

exports.social =
  share_on_twitter: (req, res) ->
    category = req.params.category.replace '-', '_'
    @article = find_article_by_category_and_id category, parseInt(req.params.id)
    if @article
      res.render 'social/share',
        article: @article
        sub_title: 'Delen op Twitter'
        description: 'De volgende tekst wordt getweet:'
    else
      throw Error "Kan kledingstuk #{req.params.id} niet vinden."

  share_on_facebook: (req, res) ->
    category = req.params.category.replace '-', '_'
    @article = find_article_by_category_and_id category, parseInt(req.params.id)
    if @article
      res.render 'social/share', 
      article: @article
      sub_title: 'Delen op Facebook'
      description: 'De volgende tekst wordt op je tijdlijn geplaatst:'
    else
      throw Error "Kan kledingstuk #{req.params.id} niet vinden."
  
  feedback: (req, res) ->
    res.render 'social/feedback'

exports.stores = 
  index: (req, res) ->
    @active_store = find_store_by_id parseInt(req.params.id)
    if @active_store
      @stores = _.values stores
      res.render 'stores/index.eco', title: 'Winkels in de buurt', stores: @stores, active_store: @active_store      
    else
      throw Error "Kan winkel #{req.params.id} niet vinden."

exports.barcode_scanner =
  index: (req, res) ->
    res.render 'barcode_scanner', title: 'Scan een barcode'