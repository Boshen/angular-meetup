generate = require '../generate'
faker = require 'faker'

module.exports = generate
  path: '/api/rows'
  template:
    rows: -> [1..1000].map (i)->
      id: i
      avatar: faker.image.image()
      email: faker.internet.email()
      name: faker.name.findName()
      cash1: Math.floor(Math.random() * 1e6)
      cash2: Math.floor(Math.random() * 1e6)
      cash3: Math.floor(Math.random() * 1e6)
      cash4: Math.floor(Math.random() * 1e6)
      cash5: Math.floor(Math.random() * 1e6)
      cash6: Math.floor(Math.random() * 1e6)
      cash7: Math.floor(Math.random() * 1e6)
      date: faker.date.past()
      address: faker.address.streetAddress()
