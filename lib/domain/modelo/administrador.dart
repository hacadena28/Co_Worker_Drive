class Administrador {
  var nombres;
  var apellidos;
  var sexo;
  var telefono;
  var correo;
  var clave;
  var tipoUsuario;

  Administrador(
      {this.nombres,
      this.apellidos,
      this.sexo,
      this.telefono,
      this.correo,
      this.clave,
      this.tipoUsuario = "administrador"});
}

List<Administrador> listaAdministradores = [];
