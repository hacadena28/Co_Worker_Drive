class Pasajero {
  var nombres;
  var apellidos;
  var sexo;
  var telefono;
  var correo;
  var clave;
  var tipoUsuario;

  Pasajero(
      {this.nombres,
      this.apellidos,
      this.sexo,
      this.telefono,
      this.correo,
      this.clave,
      this.tipoUsuario = "pasajero"});
}

List<Pasajero> listaPasajeros = [];
