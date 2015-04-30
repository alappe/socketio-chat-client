# Person Model
AmpModel = require 'ampersand-model'
fecha = require 'fecha'

module.exports = AmpModel.extend
  idProperty: 'id'
  props:
    id:
      type: 'string'
      required: true
      setOnce: true
    name:
      type: 'string'
      required: true
      default: -> app.name
    content:
      type: 'string'
      required: true
    date:
      type: 'date'
      required: true
      default: -> new Date()
    twitter:
      type: 'boolean'
      required: true
      default: false
  derived:
    at:
      deps: ['date']
      fn: -> fecha.format @date, 'HH:mm:ss'

