Router = require 'ampersand-router'

module.exports = Router.extend
  routes:
    '': 'home',
    '(*path)': 'catchAll'
  # Actually we don't really need routing in this app
  home: -> console.log 'Welcome home'
  catchAll: -> @redirectTo ''
