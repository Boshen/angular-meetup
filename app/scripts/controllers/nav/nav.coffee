'use strict'

angular.module 'meetup.nav', []

.controller 'NavCtrl', ($state)->

  @navs = [
    {ref: 'intro', name: 'Intro'}
    {ref: 'step1', name: 'Step 1'}
    {ref: 'step2', name: 'Step 2'}
  ]

  @active = (nav)->
    $state.includes(nav.ref)

  this
