function AppCtrl($http, $location, $log, $route, $routeParams, $scope, $timeout) {
  $scope.action = [];
  $scope.msgs = [];

  $scope.activeAction = function(fav) {
    if ($scope.root == fav) return 'active'
    else return '';
  };

  $scope.activeBranch = function(fav) {
    if ($scope.branch == fav) return 'active'
    else return '';
  };

  $scope.activeLeaf = function(fav) {
    if ($scope.leaf == fav) return 'active'
    else return '';
  };

  $scope.branchURL = function(branch) {
    return $scope.root + '/' + branch;
  };

  $scope.leafURL = function(leaf) {
    return $scope.root + '/' + $scope.branch + '/' + leaf;
  };

  $scope.rootURL = function(root) {
    return root + '/';
  };

  $scope.$on('$routeChangeSuccess', function (scope, next, current) {
    $scope.root = $routeParams.root;
    $scope.branch = $routeParams.branch;
    $scope.leaf = $routeParams.leaf;
  });
}
