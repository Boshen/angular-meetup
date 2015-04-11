'use strict'

angular.module 'meetup.step2', [
  'meetup.services'
]

.controller 'Step2Ctrl', ($scope, WatchersService)->
  @persons = []
  @name = ''

  @countWatchers = =>
    @watchers = WatchersService.count($scope)

  @reset = =>
    @persons = []

  @loadPersons = (number)=>
    @persons =
      _.map _.range(number), (i)->
        age = _.random(60)
        {
          id: i
          firstname: faker.name.firstName()
          lastname: faker.name.lastName()
          age: age
          gender: _.sample ['M', 'F']
          url: _.sample [null, faker.image.imageUrl()]
          ageColor: ageColor(age)
        }

  @refresh = =>
    @loadPersons(@persons.length)

  ageColor = (age)->
    if age < 18
      {'background-color': 'red', color: 'white'}
    else if age > 60
      {'background-color': 'brown', color: 'yellow'}
    else
      null

  @loadPersons(2)

  this
