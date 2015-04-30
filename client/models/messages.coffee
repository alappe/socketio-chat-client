# Message Collection
AmpCollection = require 'ampersand-rest-collection'
Message = require './message'

module.exports = AmpCollection.extend
  model: Message

  initialize: (opts) ->
    console.log 'creating messages collection…'
