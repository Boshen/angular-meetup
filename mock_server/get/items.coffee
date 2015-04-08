generate = require '../generate'
module.exports = generate
  path: '/api/items'
  template:
    test: ->
      [1..10]
