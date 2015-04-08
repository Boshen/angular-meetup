'use strict'

angular.module 'meetup.step1', []

.controller 'Step1Ctrl', ($http)->
  @list = [1..200]

  $http.get('/api/items')
    .then (response)->
      console.log response

  this
