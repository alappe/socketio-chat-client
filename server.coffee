Hapi = require 'hapi'
config = require 'getconfig'
server = new Hapi.Server config.http.listen, config.http.port
moonbootsConfig = require './moonbootsConfig'
internals = {}

# set clientconfig cookie
internals.configStateConfig =
  encoding: 'none',
  ttl: 1000 * 60 * 15,
  isSecure: config.isSecure

server.state 'config', internals.configStateConfig
internals.clientConfig = JSON.stringify config.client
server.ext 'onPreResponse', (request, reply) ->
  unless request.state.config
    response = request.response
    reply(response.state('config', encodeURIComponent(internals.clientConfig)))
  else
    reply()

# require moonboots_hapi plugin
server.pack.register {plugin: require('moonboots_hapi'), options: moonbootsConfig}, (err) ->
  throw err if err
  # If everything loaded correctly, start the server:
  server.start (err) ->
    throw err if err
    msg = """
    http://localhost:#{config.http.port} Yep. That's pretty awesome.
    """
    console.log msg
