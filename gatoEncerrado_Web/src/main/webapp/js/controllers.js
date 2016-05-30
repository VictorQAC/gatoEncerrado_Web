app.factory('InformacionUsuario', [ function() {
	var usuario = {};

	usuario.nombreUsuario = '';
	usuario.contrasenia = '';

	return usuario;
} ])

app.controller('HeaderController', [
		'$scope',
		'InformacionUsuario',
		function($scope, InformacionUsuario) {
			$scope.usuario = '';

			$scope.$on('login',
					function(event, data) {
						$scope.usuario = InformacionUsuario.nombreUsuario
								.toUpperCase();
					})
		} ])

app.controller('LoginController', [
		'$scope',
		'$location',
		'Login',
		'$resource',
		'$rootScope',
		'InformacionUsuario',
		function($scope, $location, Login, $resource, $rootScope,
				InformacionUsuario) {

			$scope.nombreUsuario = "";
			$scope.contrasenia = "";

			$scope.logIn = function() {
				Login.get({
					nombreUsuario : $scope.nombreUsuario,
					contrasenia : $scope.contrasenia
				}, function(response) {
					InformacionUsuario.nombreUsuario = $scope.nombreUsuario;
					InformacionUsuario.contrasenia = $scope.contrasenia;
					$rootScope.$broadcast('login', $scope.nombreUsuario);
					$location.path("/seleccionar");
				}, function(err) {
					alert(err.data);
				})
			}
		} ])

app.controller('SeleccionarController', [ '$scope', 'Seleccion',
		'InformacionUsuario', function($scope, Seleccion, InformacionUsuario) {

			Seleccion.get({
				idUsuario : InformacionUsuario.nombreUsuario
			}, function(response) {
				$scope.laberintos = response.listaLaberintos;
			}, function(err) {
				alert(err.data);
			})

		} ])

app.controller('JugarController', [ '$scope', '$routeParams', 'JugarLaberinto',
		'InformacionUsuario',
		function($scope, $routeParams, JugarLaberinto, InformacionUsuario) {

			$scope.accionFiltrada = '';
			$scope.itemFiltrado = '';

			JugarLaberinto.obtenerLaberinto({
				idLaberinto : $routeParams.id,
				idUsuario : InformacionUsuario.nombreUsuario
			}, function(response) {
				$scope.laberinto = response;
				$scope.habitacionActual = response.habitaciones[0];
			}, function(err) {
				alert(err.data)
			})

		}])
;
