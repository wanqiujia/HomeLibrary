adminApp.controller('containerController', ['$scope', '$state', function ($scope, $state) {

    $scope.menuData = {};

    $scope.getMenuData = function () {
        return $state.current;
    };

}]);
