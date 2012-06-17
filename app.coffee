express         = require 'express'
express_helpers = require 'express-helpers'
eco             = require 'eco'
routes          = require './routes'
assets          = require 'connect-assets'

app = module.exports = express.createServer();

# Configuration

app.configure ->
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use assets()
  app.use express.static(__dirname + '/public')
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'eco'
  app.register '.eco', eco

app.configure 'development', ->
  app.use express.errorHandler dumpExceptions: true, showStack: true

app.configure 'production', ->
  app.use express.errorHandler()

# Helpers
express_helpers app

app.helpers
  cycle: (classes, i) ->
    classes[i % classes.length]

app.dynamicHelpers
  path: (req) ->
    req.path

# Routes

app.get '/', routes.barcode_scanner.index
app.get '/menu', routes.index
app.get '/articles/:category', routes.articles.index
app.get '/articles/:category/:id/:subpage?', routes.articles.show
app.get '/articles/:category/:id/assortment/:size?', routes.articles.show
app.get '/stores', routes.stores.index
app.get '/share-on-twitter/:category/:id', routes.social.share_on_twitter
app.get '/share-on-facebook/:category/:id', routes.social.share_on_facebook

app.listen (process.env.PORT or 3000)
console.log "Web server listening on port %d in %s mode", app.address().port, app.settings.env
