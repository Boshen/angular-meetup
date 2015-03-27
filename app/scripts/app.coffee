'use strict'

###*
 # @ngdoc overview
 # @name meetupApp
 # @description
 # # meetupApp
 #
 # Main module of the application.
###
angular
  .module 'meetupApp', [
    'ngRoute'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      .otherwise
        redirectTo: '/'

