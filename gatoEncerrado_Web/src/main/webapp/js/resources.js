app.factory('Libros', ['$resource', function($resource) {
    return $resource('/log', {
    	'get' : { method: 'GET', params:{ 'nombreUsuario': '@nombreUsuario', 'contrasenia': '@contrasenia' } }
    });
}])