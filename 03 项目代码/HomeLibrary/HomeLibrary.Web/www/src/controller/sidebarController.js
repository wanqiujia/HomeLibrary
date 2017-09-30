adminApp.controller('sidebarController', ['$scope', 'menuService', '$state', function ($scope, menuService, $state) {

    $scope.menus = [];

    $scope.Init = function () {
        menuService.query().then(function (data) {
            $scope.menus = data;
        });
    };

    $scope.IsCurrentURL = function (url) {
        return $state.includes(url);
    };

    $scope.Init();
}]);
