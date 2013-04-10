function InterludeController($log, $route, $routeParams, $scope, $timeout) {
  $scope.goober = "flarn";

  $scope.rootStyle = function(fav) {
    if ($scope.root == fav) return 'active'
    else return '';
  };

  $scope.branchStyle = function(fav) {
    if ($scope.branch == fav) return 'active'
    else return '';
  };

  $scope.leafStyle = function(fav) {
    if ($scope.leaf == fav) return 'active'
    else return '';
  };

  $scope.rootURL = function(root) {
    return interlude.URL;
  };

  $scope.rootURL = function(root) {
    return interlude.URL + '/' + root + '/';
  };

  $scope.branchURL = function(branch) {
    return interlude.URL + '/' + $scope.root + '/' + branch;
  };

  $scope.leafURL = function(leaf) {
    return interlude.URL + '/' + $scope.root + '/' + $scope.branch + '/' + leaf;
  };

  $scope.$on('$routeChangeSuccess', function(scope, next, current) {
    $log.warn('route change');
    $scope.root = $routeParams.root;
    $scope.branch = $routeParams.branch;
    $scope.leaf = $routeParams.leaf;
  });
}