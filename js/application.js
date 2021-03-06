var interlude = {
	URL: '/Interlude'
}

var WSmsg;

angular.module('app', ['app.filters', 'app.services', 'app.directives', 'ui', 'ui.bootstrap'])
.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
	// interlude.URL = window.location.pathName;

	$routeProvider
	.when(interlude.URL + '/:root')
	.when(interlude.URL + '/:root/:branch')
	.when(interlude.URL + '/:root/:branch/:leaf')
	.otherwise({redirectTo: interlude.URL + '/'});

	$locationProvider.html5Mode(true);
}])
.run(function($location, $log, $rootScope, socket) {
	$rootScope.data = {};

	$rootScope.navigate = function(path) {
		$location.path(path);
	};

	$rootScope.$watch('data', function(newVal, oldVal) {
		if (newVal !== oldVal)
			socket.emit();
	});
});
