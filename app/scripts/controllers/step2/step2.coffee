'use strict'

angular.module 'meetup.step2', [
  'meetup.constants'
  'meetup.services'
]

.controller 'Step2Ctrl', ($scope, WatchersService, Colors)->
  @persons = []
  @name = ''

  @countWatchers = =>
    @watchers = WatchersService.count($scope)

  @clear = =>
    @persons = []

  @loadPersons = (number)=>
    @persons =
      _.map _.range(number), (i)->
        age = _.random(100)
        {
          id: i
          firstname: faker.name.firstName()
          lastname: faker.name.lastName()
          age: age
          gender: _.sample ['M', 'F']
          url: _.sample [null, faker.image.imageUrl()]
          ageColor: ageColor(age)
          colors: _.map _.range(5), -> _.sample Colors
        }

  @refresh = =>
    @persons = _.map @persons, (person)->
      person.colors = _.map _.range(5), -> _.sample Colors
      person

  ageColor = (age)->
    if age < 18
      {'background-color': 'red', color: 'white'}
    else if age > 60
      {'background-color': 'brown', color: 'yellow'}
    else
      null

  @loadPersons(2)

  this
