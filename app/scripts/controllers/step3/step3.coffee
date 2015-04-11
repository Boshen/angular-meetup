'use strict'

angular.module 'meetup.step3', [
  'meetup.services'
  'react'
]

.controller 'Step3Ctrl', ($scope, WatchersService)->
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
          numbers: _.map _.range(5), -> _.random(9)
        }

  @refresh = =>
    @persons = _.map @persons, (person)->
      person.numbers = _.map _.range(5), -> _.random(9)
      person

  ageColor = (age)->
    if age < 18
      {backgroundColor: 'red', color: 'white'}
    else if age > 60
      {backgroundColor: 'brown', color: 'yellow'}
    else
      null

  @loadPersons(2)

  this

.directive 'meetupTable', (reactDirective, MeetupTable)->
  reactDirective(MeetupTable, ['persons', 'filterName'])

.factory 'MeetupTable', ->
  React.createClass
    propTypes:
      persons: React.PropTypes.array.isRequired
      filterName: React.PropTypes.string.isRequired
    render: ->
      props = @props

      rows = _.chain props.persons
        .filter (person)->
          person.firstname.toLowerCase().indexOf(props.filterName.toLowerCase()) is 0
        .map (person, i)->

          genderClass = switch person.gender
            when 'M' then 'male'
            when 'F' then 'female'

          labelClass = if person.url then '' else 'label label-important'

          numbers = _.map person.numbers, (number, i)->
            return (
              <td key={i}>{number}</td>
            )

          return (
            <tr key={person.id}>
              <td>{i + 1}</td>
              <td>{person.firstname}</td>
              <td>{person.lastname}</td>
              <td>
                <span style={person.ageColor}>
                  {person.age}
                </span>
              </td>
              <td className={genderClass}>{person.gender}</td>
              {numbers}
              <td>
                <a href={person.url}>
                  <span className={labelClass}>
                    {if person.url then 'link' else 'missing'}
                  </span>
                </a>
              </td>
            </tr>
          )
        .value()

      return (
        <table className="table table-bordered">
          <tbody>
            <tr>
              <th>#</th>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Age</th>
              <th>Gender</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>Profile</th>
            </tr>
            {rows}
          </tbody>
        </table>
      )
