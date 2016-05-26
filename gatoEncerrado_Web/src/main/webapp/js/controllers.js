'use strict';
angular.module('LaberintosApp', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
	$routeProvider
	
	.when('/', {
		templateUrl : '../html/WebGatoEncerrado.html',
		controller : 'OtroController'
	})
	
	.when('/seleccionar', {
		templateUrl : '../html/JugarEnLaHabitacion.html',
		controller : 'JugarController'
	})
	
	.otherwise({ redirectTo: '../html/404' })
	
}])

.controller('SeleccionarController', ['$scope', '$http', function ($scope, $http) {

  $http.get("http://localhost:9000/laberintos")
  .then(
    function(response) {
      $scope.laberintos = response.data;
    },
    function(response) {
      $scope.laberintos = response.statusText;
    }
  );

}])

.controller('JugarController', ['$scope', function ($scope) {
	
	$scope.valor = "PROBANDO";
	
}])

.controller('OtroController', [ '$scope', function ($scope) {
	
	$scope.test = 0;
	
}])

;