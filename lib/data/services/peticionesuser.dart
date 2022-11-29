import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../domain/modelo/user.dart';

class PeticionesUser {
  static Future<List<User>> validarUser(String u, String p) async {
    var url = Uri.parse(
        "https://desarolloweb2021a.000webhostapp.com/APIMOVIL/listaruser.php");
    final response = await http.post(url, body: {"user": u, "pass": p});
    return compute(convertir, response.body);
  }

  static List<User> convertir(String textbody) {
    final pasar = json.decode(textbody).cast<Map<String, dynamic>>();
    return pasar.map<User>((json) => User.desdeJson(json)).toList();
  }
}
