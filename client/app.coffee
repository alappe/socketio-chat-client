# /*global app, me, $*/
_ = require 'lodash'
logger = require 'andlog'
config = require 'clientconfig'
domReady = require 'domready'
names = require './names'

Router = require './router'
MainView = require './views/main'
Messages = require './models/messages'

module.exports =
  # this is the the whole app initter
  blastoff: () ->
    self = window.app = @

    # Fetch all clients…
    @messages = new Messages()
    @router = new Router()
    app.name = names.get()
    @initializeSocketIo()

    # wait for document ready to render our main view
    # this ensures the document has a body, etc.
    domReady =>
      # init our main view
      mainView = self.view = new MainView
        el: document.body
      mainView.render()

  initializeSocketIo: ->
    socket = app.socket = io 'http://localhost:3334'
    socket.on 'message', (data) ->
      #console.log 'received message', data
      app.messages.add data

module.exports.blastoff()
