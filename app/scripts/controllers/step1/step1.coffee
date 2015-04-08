'use strict'

angular.module 'meetup.step1', []

.filter 'formatDate', ($window)->
  (date)->
    moment(date).format('YYYY-MM-DD')

.filter 'shortenCurrency', ->
  (value)->
    suffixes = [
      ''
      'k'
      'm'
      'b'
      't'
    ]
    suffixNum = Math.floor(('' + value).length / 3)
    shortValue = parseFloat((if suffixNum != 0 then value / 1000 ** suffixNum else value).toPrecision(2))
    if shortValue % 1 != 0
      shortNum = shortValue.toFixed(1)
    '$' + shortValue + suffixes[suffixNum]

.controller 'Step1Ctrl', ($http)->
  @rows = []

  init = =>
    $http.get('/api/rows')
      .then (response)=>
        console.log response.data
        @rows = response.data.rows

  init()

  this
