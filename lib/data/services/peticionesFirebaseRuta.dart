import 'dart:developer';
import 'package:coworkerdriver/domain/modelo/ruta.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/modelo/pasajero.dart';

class PeticionesRuta {
  static final fs.FirebaseStorage storage =
      fs.FirebaseStorage.instance; // es donde guardo el link de la foto
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  PeticionesRuta(Map<String, dynamic> catalogo);

  static Future<void> crearRuta(Map<String, dynamic> catalogo) async {
    await _db.collection('Rutas').doc().set(catalogo).catchError((e) {});
    print("Creando rutaaaaaaaaaaaa");
    print("##################################################################");
  }

  static Future<List<Ruta>> consultarGral() async {
    List<Ruta> lista = [];
    await _db.collection("Rutas").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        log(doc.data().toString());
        lista.add(Ruta.desdeDoc(doc.data()));
      }
    });

    return lista;
  }
}
