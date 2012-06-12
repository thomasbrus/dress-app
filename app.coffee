express = require 'express'
eco     = require 'eco'
routes  = require './routes'
assets  = require 'connect-assets'

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
  app.use express.errorHandler({ dumpExceptions: true, showStack: true })

app.configure 'production', ->
  app.use express.errorHandler()

# Helpers

app.dynamicHelpers
  url: (req, res) ->
    req.url

# Routes

app.get '/', routes.barcode_scanner.index
app.get '/menu', routes.index
app.get '/top-9', routes.top_9.index
app.get '/stores', routes.stores.index
app.get '/seasons', routes.seasons.index

app.listen (process.env.PORT or 4000)
console.log "Web server listening on port %d in %s mode", app.address().port, app.settings.env
