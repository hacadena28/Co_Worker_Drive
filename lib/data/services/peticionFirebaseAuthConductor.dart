import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:cloud_firestore/cloud_firestore.dart';

class PeticionesConductor {
  static final fs.FirebaseStorage storage =
      fs.FirebaseStorage.instance; // es donde guardo el link de la foto
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> crearConductor(
      Map<String, dynamic> catalogo, foto) async {
    var url = '';
    if (foto != null) {
      url = await cargarfoto(foto, catalogo['correo']);
    }

    catalogo['foto'] = url.toString();

    await _db.collection('Conductores').doc().set(catalogo).catchError((e) {});
    //return true;
  }

  static Future<dynamic> cargarfoto(var foto, var correo) async {
    final fs.Reference storageReference =
        fs.FirebaseStorage.instance.ref().child("Conductores");

    fs.TaskSnapshot taskSnapshot =
        await storageReference.child(correo).putFile(foto);

    var url = await taskSnapshot.ref.getDownloadURL();

    return url.toString();
  }
}
