# Person Model
AmpModel = require 'ampersand-model'

module.exports = AmpModel.extend
  props:
    message:
      type: 'string'
      default: -> "Your name is from now on »#{app.name}«. Use it wisely!"
