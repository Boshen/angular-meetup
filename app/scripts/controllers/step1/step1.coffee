'use strict'

angular.module 'meetup.step1', [
  'meetup.services'
]

.controller 'Step1Ctrl', ($scope, WatchersService)->
  @persons = []
  @name = ''

  @countWatchers = =>
    @watchers = WatchersService.count($scope)

  @clear = =>
    @persons = []

  @loadPersons = (number)=>
    @persons =
      _.map _.range(number), (i)->
        {
          id: i
          firstname: faker.name.firstName()
          lastname: faker.name.lastName()
          age: _.random(60)
          gender: _.sample ['M', 'F']
          url: _.sample [null, faker.image.imageUrl()]
          numbers: _.map _.range(5), -> _.random(9)
        }

  @refresh = =>
    @persons = _.map @persons, (person)->
      person.numbers = _.map _.range(5), -> _.random(9)
      person

  @ageColor = (age)->
    if age < 18
      {'background-color': 'red', color: 'white'}
    else if age > 60
      {'background-color': 'brown', color: 'yellow'}
    else
      null

  @loadPersons(2)

  this
