Moonboots = require 'moonboots-static'

moonboots = new Moonboots
  moonboots: (require './moonbootsConfig').moonboots
  public: "#{__dirname}/public"
  directory: "#{__dirname}/../public/"
  verbose: true
  cb: (err) ->
    if err?
      console.log 'Error'
    else
      console.log 'Build done…'
