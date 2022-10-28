class User {
  final String id;
  final String nombre;
  final String rol;
  final String user;

  User(
      {required this.id,
      required this.nombre,
      required this.rol,
      required this.user});

  factory User.desdeJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        nombre: json["nombre"],
        rol: json["rol"],
        user: json["user"]);
  }
}
