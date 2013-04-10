angular.module('app.services', [])
.factory('socket', function ($log, $rootScope) {
  WSmsg = function() {
    $log.info('WS msg: ', arguments);
    emitEvent(arguments);
  };

  function emitEvent(eventName, data, callback) {
    $log.info(eventName, data, callback);

    var args = arguments;
    $rootScope.$apply(function () {
      if (callback) {
        callback.apply(socket, args);
      }
    });
  }

  function onEvent(eventName, callback) {
    $log.info(eventName, callback);
    
    var args = arguments;
    $rootScope.$apply(function () {
      callback.apply(socket, args);
    });
  }

  return {
    emitEventt: emitEvent,
    on: onEvent
  };
});