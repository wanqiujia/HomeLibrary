
var adminApp = angular.module('adminApp', [
    'ui.router',
    'ui.bootstrap',
    'oc.lazyLoad',
    'ngTable',
    'ngFileUpload',
    'restangular',
    'LocalStorageModule',
    'ngAnimate'
]);

adminApp.config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise('/member/login');

    $stateProvider
        .state('main', {
            url: '/main',
            template: '<div ui-view></div>',
            abstract: true
        })
        .state('main.default', {
            url: '/default',
            data: { pageTitle: '图书管理',smallTitle:'' },
            templateUrl: 'default.html'
        })
        .state('member', {
            url: '/member',
            template: '<div ui-view></div>',
            abstract: true
        })
        .state('member.login', {
            url: '/login',
            data: { pageTitle: '用户登录' },
            templateUrl: 'login.html'
        })
        .state('app', {
            url: '/app',
            templateUrl: 'template/app.html',
            abstract: true
        })
        .state('app.home', {
            url: '/home',
            data: { pageTitle: '首页', smallTitle: 'statistics and more' },
            templateUrl: 'views/home.html',
            resolve: {
                service: ['$ocLazyLoad', function ($ocLazyLoad) {
                    return $ocLazyLoad.load({
                        files: [
                            'assets/plugins/bootstrap-datepicker/css/datepicker.css',
                            'assets/plugins/bootstrap-datepicker/css/datepicker3.css',
                            'assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js'
                        ]
                    });
                }]
            }
        })
        .state('app.query', {
            url: '/query',
            template: '<div ui-view></div>',
            abstract: true
        })
        .state('app.setting', {
            url: '/setting',
            template: '<div ui-view></div>',
            abstract: true
        })
        .state('app.base', {
            url: '/base',
            template: '<div ui-view></div>',
            abstract: true
        })
        .state('app.category', {
            url: '/category',
            template: '<div ui-view></div>',
            abstract: true
        })
        .state('app.category.categoryManagement', {
            url: '/categoryManagement',
            data: { pageTitle: '图书分类' },
            templateUrl: 'views/category/categoryManagement.html'
        })
        .state('app.export', {
            url: '/base',
            template: '<div ui-view></div>',
            abstract: true
        })
        .state('app.setting.password', {
            url: '/password',
            data: { pageTitle: '密码修改' },
            templateUrl: 'views/password.html'
        })
        .state('app.setting.selfInfo', {
            url: '/selfInfo',
            data: { pageTitle: '个人信息' },
            templateUrl: 'views/selfInfo.html'
        })
        .state('app.setting.userInfo', {
            url: '/userInfo',
            data: { pageTitle: '用户信息' },
            templateUrl: 'views/userInfo.html'
        })
}]);

adminApp.run(function ($rootScope, $state, BaseConfig, Restangular, localStorageService) {
    if (BaseConfig.IsOffLine == "true") {
        Restangular.setBaseUrl(BaseConfig.Data_URL);
    } else {
        Restangular.setBaseUrl(BaseConfig.API_URL);
    }

    $rootScope.identity = localStorageService.get('identity');
    var token = '';
    if ($rootScope.identity != undefined) {
        token = $rootScope.identity.Token;
        Restangular.setDefaultHeaders({ 'Authorization': 'Bearer ' + token });
    }

    Restangular.setRequestInterceptor(function (elem, operation, what) {
        //Pace.restart();
        $rootScope.loading = true;
        return elem;
    });
    Restangular.setResponseInterceptor(function (data, operation, what) {
        //Pace.stop();
        $rootScope.loading = false;
        return data;
    });
    Restangular.setErrorInterceptor(function (resp) {
        $rootScope.loading = false;
        if (resp.status == 401) {
            $state.go('member.login');
        }
        else {
            if (resp.data != null) {
                alert(resp.data.Message + (resp.status == 500 ? '' : resp.status));
            }
            else {
                alert("未知错误! " + resp.status);
            }

            return false;
        }
    });
});

//adminApp.run(function ($rootScope, $state) {
//    $rootScope.$state = $state;
//    //$rootScope.setting = setting;

//    $rootScope.formatDate = function (date) {
//        if (date == null || date == undefined) {
//            return "";
//        }

//        return date.substr(0, 10);
//    };

//    $rootScope.formatDateTime = function (date) {
//        if (date == null || date == undefined) {
//            return "";
//        }

//        return date.replace('T', ' ').substr(0, 19);
//    };
//});
