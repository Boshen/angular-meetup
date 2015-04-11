'use strict'

angular.module 'meetup.step3', [
  'react'
]

.controller 'Step3Ctrl', ->
  @persons = []
  @name = ''

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
              <th>Profile</th>
            </tr>
            {rows}
          </tbody>
        </table>
      )
