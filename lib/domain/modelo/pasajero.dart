class Pasajero {
  var nombres;
  var apellidos;
  var sexo;
  var telefono;
  var correo;
  var clave;
  var tipoUsuario;
  var placa;
  final String foto;

  Pasajero(
      {required this.nombres,
      required this.apellidos,
      required this.sexo,
      required this.telefono,
      required this.correo,
      required this.clave,
      this.tipoUsuario = "pasajero",
      required this.foto,
      required this.placa});

  factory Pasajero.desdeDoc(Map<String, dynamic> data) {
    return Pasajero(
      nombres: data['nombres'] ?? '',
      apellidos: data['apellidos'] ?? '',
      sexo: data['sexo'] ?? '',
      telefono: data['telefono'] ?? '',
      correo: data['correo'] ?? '',
      clave: data['clave'] ?? '',
      foto: data['foto'] ?? '',
      placa: data['placa'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "nombres": nombres,
        "apellidos": apellidos,
        "sexo": sexo,
        "telefono": telefono,
        "correo": correo,
        "clave": clave,
        "foto": foto,
        "placa": placa,
      };
}
