adminApp.controller('loginController', ['$scope', '$rootScope', '$state', 'localStorageService', 'Restangular', function ($scope, $rootScope, $state, localStorageService, Restangular) {
    //$rootScope.setting.layout.pageWithoutHeader = true;
    //$rootScope.setting.layout.paceTop = true;
    //$rootScope.setting.layout.pageBgWhite = true;

    $scope.loginRequest = {};

    $scope.login = function (e) {
        if (e != null) {
            var keycode = window.event ? e.keyCode : e.which;
            if (keycode != 13 && keycode != undefined) {
                return;
            }
        }

        if ($scope.loginRequest.account == undefined || $scope.loginRequest.account == "") {
            alert("请输入用户名！");
            return
        }

        if ($scope.loginRequest.password == undefined || $scope.loginRequest.password == "") {
            alert("请输入密码！");
            return
        }
        var data = { ID: $scope.loginRequest.account, Token: $scope.loginRequest.account };

        //userService.login($scope.loginRequest).then(function (data) {
        localStorageService.set('identity', data);
        $rootScope.identity = data;
        Restangular.setDefaultHeaders({ 'Authorization': 'Bearer ' + data.Token });
        $state.go('app.home');
        //});
    };
}]);
