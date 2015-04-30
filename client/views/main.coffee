# /*global app, me, $*/
# This app view is responsible for rendering all content that goes into
# <html>. It's initted right away and renders itself on DOM ready.

# This view also handles all the 'document' level events such as keyboard shortcuts.
View = require 'ampersand-view'
ViewSwitcher = require 'ampersand-view-switcher'
_ = require 'lodash'
domify = require 'domify'
uuid = require 'uuid'
dom = require 'ampersand-dom'
templates = require '../templates'

Message = require '../models/message'
MessageView = require './message'
Alert = require '../models/alert'
AlertView = require './alert'

module.exports = View.extend
  template: templates.body

  initialize: ->
    # this marks the correct nav item selected
    this.listenTo app.router, 'page', this.handleNewPage

  events:
    'submit form.message-input': 'handleMessageInput'

  handleMessageInput: (e) ->
    e.preventDefault()
    input = (e.target.querySelector 'input').value
    message = new Message
      id: uuid.v4()
      content: (e.target.querySelector 'input').value
    app.messages.add message
    app.socket.emit 'message', message.toJSON()
    # Reset to default text…
    (e.target.querySelector 'input').value = ''

  render: ->
    # some additional stuff we want to add to the document head
    document.head.appendChild (domify templates.head())

    # main renderer FIXME
    @renderWithTemplate()
    @renderCollection app.messages, MessageView, '#messages'
    alertView = new AlertView
      model: new Alert()
      el: @query '#alerts'
    alertView.render()
    @
