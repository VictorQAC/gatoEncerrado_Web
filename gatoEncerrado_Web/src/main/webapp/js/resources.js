app.factory('Login', ['$resource', function($resource) {
    return $resource('/log', {
    	'get' : { method: 'GET', params:{ 'nombreUsuario': '@nombreUsuario', 'contrasenia': '@contrasenia' } }
    });
}])

app.factory('Seleccion', ['$resource', function($resource) {
    return $resource('/laberintos', {
    	'get' : { method: 'GET', params:{ 'idUsuario': '@idUsuario' } }
    });
}])

app.factory('JugarLaberinto', ['$resource', function($resource) {
    return $resource('/iniciarLaberinto/:idLaberinto', { 'idLaberinto' : '@idLaberinto' }, {
    	'obtenerLaberinto' : { method: 'GET', params:{ 'idUsuario': '@idUsuario' } }
    });
}])