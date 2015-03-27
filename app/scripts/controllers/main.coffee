'use strict'

###*
 # @ngdoc function
 # @name meetupApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the meetupApp
###
angular.module 'meetupApp'
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
