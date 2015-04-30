View = require 'ampersand-view'
templates = require '../templates'

module.exports = View.extend
  template: templates.includes.message
  bindings:
    'model.name':
      type: 'text'
      hook: 'name'
    'model.at':
      type: 'text'
      hook: 'date'
    'model.content':
      type: 'text'
      hook: 'content'
    'model.twitter':
      type: 'booleanClass'
      hook: 'twitter'
  render: ->
    View.prototype.render.apply @, arguments
    window.scrollTo 0, document.body.scrollHeight
