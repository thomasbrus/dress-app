{spawn} = require 'child_process'

server = null

stream = (command, options) ->
  subprocess = spawn command, options
  subprocess.stdout.on 'data', (data) -> process.stdout.write data
  subprocess.stderr.on 'data', (data) -> process.stderr.write data
  subprocess

run_server = ->
  server?.kill()
  server = stream 'coffee', ['app.coffee']
  
deploy = ->
  console.log 'Not yet implemented.'
  
task 'server', 'Run web server', ->
  run_server()

task 'deploy', 'Deploy to Heroku', ->
  deploy()
