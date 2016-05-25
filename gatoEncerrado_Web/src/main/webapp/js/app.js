'use strict';
angular.module('LaberintosApp', [])

.controller('SeleccionarController', ['$scope', '$http', function ($scope, $http) {

  $scope.valor = "ANGULAR ESTA ANDANDO";

  $http.get("http://localhost:9000/laberintos")
  .then(
    function(response) {
      $scope.mensaje = response.data;
    },
    function(response) {
      $scope.mensaje = response.statusText;
    }
  );

}]);
