'use strict'

###*
 # @ngdoc function
 # @name meetupApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the meetupApp
###
angular.module 'meetupApp'
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
