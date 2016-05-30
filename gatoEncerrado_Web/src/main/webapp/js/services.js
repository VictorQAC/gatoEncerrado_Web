app.factory('laberintos', function($resource) {
return $resource('/laberintos/' {
  'porUsuario': { method: 'GET', isArray: true,
    params:{'idUsuario': '@idUsuario'}}
  });
});

app.factory('iniciarLaberinto', function($resource) {
return $resource('/iniciarLaberinto/'{
  'query': { method: 'GET', isArray: true
    params:{'idLaberinto': '@idLaberinto','idUsuario': '@idUsuario'}}
  });
});

app.factory('realizarAcciónHabitación', function($resource) {
return $resource('/realizarAcciónHabitación/'{
  'query': { method: 'GET', isArray: true
    params:{'idHabitacion': '@idHabitacion','idAccion': '@idAccion','idUsuario': '@idUsuario'}}
  });
});
