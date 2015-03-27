'use strict'

angular.module 'meetup', [
  'meetup.nav'
  'meetup.step1'
  'meetup.step2'
  'ui.router'
]

.config ($stateProvider, $urlRouterProvider) ->
  $stateProvider
    .state 'intro',
      url: '/',
      views:
        main:
          templateUrl: 'scripts/controllers/intro/intro.html'
        nav:
          templateUrl: 'scripts/controllers/nav/nav.html'
          controller: 'NavCtrl'
          controllerAs: 'nav'
    .state 'step1',
      url: '/step1'
      views:
        main:
          templateUrl: 'scripts/controllers/step1/step1.html'
          controller: 'Step1Ctrl'
          controllerAs: 'ctrl'
        nav:
          templateUrl: 'scripts/controllers/nav/nav.html'
          controller: 'NavCtrl'
          controllerAs: 'nav'
    .state 'step2',
      url: '/step2'
      views:
        main:
          templateUrl: 'scripts/controllers/step2/step2.html'
          controller: 'Step2Ctrl'
          controllerAs: 'ctrl'
        nav:
          templateUrl: 'scripts/controllers/nav/nav.html'
          controller: 'NavCtrl'
          controllerAs: 'nav'

  $urlRouterProvider.otherwise('/')
