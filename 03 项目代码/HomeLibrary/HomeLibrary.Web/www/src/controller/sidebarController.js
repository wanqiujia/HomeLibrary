adminApp.controller('sidebarController', ['$scope', 'menuService', function ($scope, menuService) {

    $scope.menus = menuService.query().then(function (data) {
        return data;
    });

}]);
