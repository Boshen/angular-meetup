generate = require '../generate'

module.exports = generate
  path: '/api/rows'
  template:
    rows: -> [1..50].map (i)->
      id: i
