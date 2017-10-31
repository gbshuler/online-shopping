var app = angular.module('resttestapp', []);
app.controller('RestTestController', function($scope, $http) {
	$http({
		method : "GET",
		url : "http://10.211.55.4:8080/onlineshopping/json/data/all/products"
	}).then(function mySuccess(response) {
		$scope.products = response.data;
		console.log("Successamundo!");
		console.log($scope.products);
	}, function myError(response) {
		$scope.result = response.statusText;
		console.log("Fail!");
		console.log(response.statusText);
	});
});