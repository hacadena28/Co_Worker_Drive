class Administrador {
  var nombres;
  var apellidos;
  var correo;
  var clave;
  var tipoUsuario;

  Administrador(
      {this.nombres,
      this.apellidos,
      this.correo,
      this.clave,
      this.tipoUsuario = "administrador"});
}

List<Administrador> listaAdministradores = [];
