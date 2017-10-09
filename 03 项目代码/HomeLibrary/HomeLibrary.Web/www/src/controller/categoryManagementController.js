adminApp.controller('categoryManagementController', ['$scope', 'categoryService', '$state', function ($scope, categoryService, $state) {

    $scope.dataList = [];

    $scope.Init = function () {
        categoryService.query().then(function (data) {
            $scope.dataList = data;
        });
    };

    $scope.Init();
}]);
