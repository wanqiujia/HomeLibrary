adminApp.factory('categoryService', ['Restangular', 'BaseConfig', function (Restangular, BaseConfig) {
    var rest = new Restangular.all("Category");
    var apiFunctionName = {
        QueryCategory: "QueryCategory",
    };

    var mockFunctionName = {
        QueryCategory: "QueryCategory.json",
    };

    var functionName = apiFunctionName;

    if (BaseConfig.IsOffLine == "true") {
        functionName = mockFunctionName;
    }

    return {
        query: function () {
            return rest.get(functionName.QueryCategory);
        }
    }
}]);
