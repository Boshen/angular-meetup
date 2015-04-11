'use strict'

angular.module 'meetup.step3', [
  'meetup.constants'
  'meetup.services'
  'react'
]

.controller 'Step3Ctrl', ($scope, WatchersService, Colors)->
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
      {backgroundColor: 'red', color: 'white'}
    else if age > 60
      {backgroundColor: 'brown', color: 'yellow'}
    else
      null

  @loadPersons(2)

  this

.directive 'meetupTable', (reactDirective, MeetupTable)->
  reactDirective(MeetupTable, ['persons', 'filterName'])

.factory 'MeetupTableRow', ->
  React.createClass
    propTypes:
      person: React.PropTypes.object.isRequired
      index: React.PropTypes.number.isRequired
    render: ->
      props = @props
      person = props.person

      genderClass = switch person.gender
        when 'M' then 'male'
        when 'F' then 'female'

      labelClass = if person.url then '' else 'label label-important'

      numbers = _.map person.colors, (color, i)->
        return (
          <td key={i} style={backgroundColor:color}></td>
        )

      return (
        <tr>
          <td>{props.index + 1}</td>
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

.factory 'MeetupTable', (MeetupTableRow)->
  React.createClass
    propTypes:
      persons: React.PropTypes.array.isRequired
      filterName: React.PropTypes.string.isRequired
    render: ->
      props = @props

      rows =
        _.chain props.persons
          .filter (person)->
            person.firstname.toLowerCase().indexOf(props.filterName.toLowerCase()) is 0
          .map (person, i)->
            <MeetupTableRow key={i} person={person} index={i} />
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
