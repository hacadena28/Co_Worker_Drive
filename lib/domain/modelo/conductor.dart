class Conductor {
  var nombres;
  var apellidos;
  var sexo;
  var telefono;
  var correo;
  var placaMoto;
  var clave;
  var tipoUsuario;
  //hola mundo

  Conductor(
      {this.nombres,
      this.apellidos,
      this.sexo,
      this.telefono,
      this.correo,
      this.placaMoto,
      this.clave,
      this.tipoUsuario = "conductor"});
}

List<Conductor> listaConductores = [];
