'use strict'

angular.module 'meetup.step2', []

.filter 'formatDate', ($window)->
  (date)->
    $window.moment(date).format('YYYY-MM-DD HH:MM:SS')

.controller 'Step2Ctrl', ($http)->
  @rows = []

  @query = =>
    $http.get('/api/rows')
      .then (response)=>
        @rows = response.data.rows

  this

.directive 'stepTwoCell', ($http, formatDateFilter)->
  restrict: 'A'
  replace: true
  scope: {}
  template: '''
    <td class="cell" ng-click="ctrl.update()" ng-class="{'bg-success': ctrl.updated, 'bg-danger': !ctrl.updated}">
      {{ctrl.date}}
    </td>
  '''
  controllerAs: 'ctrl'
  bindToController: true
  controller: ->

    @update = =>
      $http.get('/api/status')
        .then (response)=>
          @date = response.data.date #formatDateFilter(response.data.date)
          @updated = not @updated

    @update()

    this

