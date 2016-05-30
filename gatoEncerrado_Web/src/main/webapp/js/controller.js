app.controller('laberintosCtrl', function($resource, $timeout,
		cfpLoadingBar, laberintos, iniciarLaberinto,realizarAcciónHabitación) {
	'use strict';

	var self = this;
	this.name = "pedro"

  function errorHandler(error) {
		self.notificarError(error.data);
	}
	;

   this.descripcionLaberinto(laberintos) {
    laberintos.porUsuario(1).nombreLaberinto
  }
