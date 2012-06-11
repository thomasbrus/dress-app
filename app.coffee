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

# Routes

app.get '/', routes.index
app.get '/barcode-scanner', routes.barcode_scanner
app.get '/top-9', routes.top_9
app.get '/stores', routes.stores
app.get '/seasons', routes.seasons

app.listen (process.env.PORT or 3000)
console.log "Web server listening on port %d in %s mode", app.address().port, app.settings.env
