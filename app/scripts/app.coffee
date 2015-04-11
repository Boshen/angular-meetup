'use strict'

angular.module 'meetup', [
  'meetup.services'
  'meetup.nav'
  'meetup.step1'
  'meetup.step2'
  'meetup.step3'
  'react'
  'ui.router'
]

.config ($stateProvider, $urlRouterProvider)->

  navView =
    templateUrl: 'scripts/controllers/nav/nav.html'
    controller: 'NavCtrl'
    controllerAs: 'nav'

  $stateProvider
    .state 'intro',
      url: '/'
      views:
        main:
          templateUrl: 'scripts/controllers/intro/intro.html'
        nav:
          navView
    .state 'step1',
      url: '/step1'
      views:
        main:
          templateUrl: 'scripts/controllers/step1/step1.html'
          controller: 'Step1Ctrl'
          controllerAs: 'ctrl'
        nav:
          navView
    .state 'step2',
      url: '/step2'
      views:
        main:
          templateUrl: 'scripts/controllers/step2/step2.html'
          controller: 'Step2Ctrl'
          controllerAs: 'ctrl'
        nav:
          navView
    .state 'step3',
      url: '/step3'
      views:
        main:
          templateUrl: 'scripts/controllers/step3/step3.html'
          controller: 'Step3Ctrl'
          controllerAs: 'ctrl'
        nav:
          navView

  $urlRouterProvider.otherwise('/')
