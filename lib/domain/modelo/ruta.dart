class Ruta {
  var origen;
  var destiono;
  var tarifa;
  var descripcion;
  var estado = "Pendiente";

  Ruta({
    required this.origen,
    required this.destiono,
    required this.tarifa,
    this.descripcion,
    required this.estado,
  });

  factory Ruta.desdeDoc(Map<String, dynamic> data) {
    return Ruta(
      origen: data['origen'] ?? '',
      destiono: data['destiono'] ?? '',
      tarifa: data['tarifa'] ?? '',
      descripcion: data['descripcion'] ?? '',
      estado: data['estado'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => {
        "origen": origen,
        "destiono": destiono,
        "tarifa": tarifa,
        "descripcion": descripcion,
        "estado": estado
      };
}
