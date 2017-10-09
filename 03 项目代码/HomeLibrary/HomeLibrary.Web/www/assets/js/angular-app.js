
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
            data: { pageTitle: '图书管理', smallTitle: '' },
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

        //category
        .state('app.category', {
            url: '/category',
            template: '<div ui-view></div>',
            abstract: true
        })
        .state('app.category.categoryManagement', {
            url: '/categoryManagement',
            data: {
                pageTitle: '图书分类', smallTitle: 'Book Category',
                parentURL: 'app.category.categoryManagement',
                parentPageTitle: '图书分类'
            },
            templateUrl: 'views/category/categoryManagement.html'
        })

        //book
        .state('app.book', {
            url: '/book',
            template: '<div ui-view></div>',
            abstract: true
        })
        .state('app.book.bookManagement', {
            url: '/bookManagement',
            data: {
                pageTitle: '图书管理', smallTitle: 'Books',
                parentURL: 'app.book.bookManagement',
                parentPageTitle: '图书管理'
            },
            templateUrl: 'views/books/bookManagement.html'
        })

        //readingProject
        .state('app.readingProject', {
            url: '/readingProject',
            template: '<div ui-view></div>',
            abstract: true
        })
        .state('app.readingProject.readingProjectManagement', {
            url: '/readingProjectManagement',
            data: {
                pageTitle: '阅读计划', smallTitle: 'Reading Project',
                parentURL: 'app.readingProject.readingProjectManagement',
                parentPageTitle: '阅读计划'
            },
            templateUrl: 'views/readingProject/readingProjectManagement.html'
        })

        //bookNotes
        .state('app.bookNotes', {
            url: '/bookNotes',
            template: '<div ui-view></div>',
            abstract: true
        })
        .state('app.bookNotes.bookNotesManagement', {
            url: '/bookNotesManagement',
            data: {
                pageTitle: '阅读笔记', smallTitle: 'BookNotes',
                parentURL: 'app.bookNotes.bookNotesManagement',
                parentPageTitle: '阅读笔记'
            },
            templateUrl: 'views/bookNotes/bookNotesManagement.html'
        })

        //borrower
        .state('app.borrower', {
            url: '/borrower',
            template: '<div ui-view></div>',
            abstract: true
        })
        .state('app.borrower.borrowerManagement', {
            url: '/borrowerManagement',
            data: {
                pageTitle: '借阅人管理', smallTitle: 'Borrower',
                parentURL: 'app.borrower.borrowerManagement',
                parentPageTitle: '借阅人管理'
            },
            templateUrl: 'views/borrower/borrowerManagement.html'
        })

        //borrowingRecords
        .state('app.borrowingRecords', {
            url: '/borrowingRecords',
            template: '<div ui-view></div>',
            abstract: true
        })
        .state('app.borrowingRecords.borrowingRecordsManagement', {
            url: '/borrowingRecordsManagement',
            data: {
                pageTitle: '借阅管理', smallTitle: 'Borrowing Records',
                parentURL: 'app.borrowingRecords.borrowingRecordsManagement',
                parentPageTitle: '借阅管理'
            },
            templateUrl: 'views/borrowingRecords/borrowingRecordsManagement.html'
        })

        //statistics
        .state('app.statistics', {
            url: '/statistics',
            template: '<div ui-view></div>',
            abstract: true
        })
        .state('app.statistics.statisticsManagement', {
            url: '/statisticsManagement',
            data: {
                pageTitle: '信息统计', smallTitle: 'Statistics',
                parentURL: 'app.statistics.statisticsManagement',
                parentPageTitle: '信息统计'
            },
            templateUrl: 'views/statistics/statisticsManagement.html'
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
