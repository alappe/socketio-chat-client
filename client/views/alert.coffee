View = require 'ampersand-view'
templates = require '../templates'

module.exports = View.extend
  template: templates.includes.alert
  events:
    'click a.close': 'destroyAlert'
  bindings:
    'model.message':
      type: 'text'
      hook: 'message'
  destroyAlert: (e) ->
    e.preventDefault()
    @model.destroy()
    @remove()
