'use strict'

angular.module 'meetup.services', []

.factory 'WatchersService', ->
  service = {}

  service.count = (scope)->
    watchers = if scope.$$watchers then scope.$$watchers.length else 0
    child = scope.$$childHead
    while child
      watchers += if child.$$watchers then child.$$watchers.length else 0
      child = child.$$nextSibling
    watchers

  service
