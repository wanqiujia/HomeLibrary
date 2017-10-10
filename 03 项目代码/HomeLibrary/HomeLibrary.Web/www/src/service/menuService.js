adminApp.factory('menuService', ['Restangular', 'BaseConfig', function (Restangular, BaseConfig) {
    var rest = new Restangular.all("Menu");
    var apiFunctionName = {
        QueryMenu: "QueryMenu",
    };

    var mockFunctionName = {
        QueryMenu: "QueryMenu.json",
    };

    var functionName = apiFunctionName;

    if (BaseConfig.IsOffLine == "true") {
        functionName = mockFunctionName;
    }

    return {
        query: function () {
            return rest.get(functionName.QueryMenu);
        }
    }
}]);
