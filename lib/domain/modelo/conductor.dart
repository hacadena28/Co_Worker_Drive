class Conductor {
  var nombres;
  var apellidos;
  var sexo;
  var telefono;
  var correo;
  var placaMoto;
  var clave;
  var tipoUsuario;
  final String foto;

  //hola mundo

  Conductor(
      {required this.nombres,
      required this.apellidos,
      required this.sexo,
      required this.telefono,
      required this.correo,
      required this.placaMoto,
      required this.clave,
      this.tipoUsuario = "conductor",
      required this.foto});


  factory Conductor.desdeDoc(Map<String, dynamic> data) {
    return Conductor(
      nombres: data['nombres'] ?? '',
      apellidos: data['apellidos'] ?? '',
      sexo: data['sexo'] ?? '',
      telefono: data['telefono'] ?? '',
      correo: data['correo'] ?? '',
      placaMoto: data['placaMoto'] ?? '',
      clave: data['clave'] ?? '',
      foto: data['foto'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => {
        "nombres": nombres,
        "apellidos": apellidos,
        "sexo": sexo,
        "telefono": telefono,
        "correo": correo,
        "placaMoto": placaMoto,
        "clave": clave,
        "foto": foto
      };
}
