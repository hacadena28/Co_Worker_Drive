import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Controllerauthf extends GetxController {
  final FirebaseAuth authf = FirebaseAuth.instance;
  final Rx<dynamic> _uid = "".obs;
  final Rx<dynamic> _usuarios = "Sin registro".obs;

  String get getUid => _uid.value;
  String get getEmail => _usuarios.value;

  Future<void> registraEmail(String email, String passwd) async {
    try {
      UserCredential usuario = await authf.createUserWithEmailAndPassword(
          email: email, password: passwd);

      _uid.value = usuario.user!.uid;
      _usuarios.value = usuario.user!.email;

      if (kDebugMode) {
        print(usuario);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('The account already exists for that email.');
      }
    }
  }

  Future<void> ingresarEmail(String email, String passwd) async {
    try {
      UserCredential usuario = await authf.signInWithEmailAndPassword(
          email: email, password: passwd);

      _uid.value = usuario.user!.uid;
      _usuarios.value = usuario.user!.email;

      if (kDebugMode) {
        print(usuario);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('Email no existe');
      } else if (e.code == 'wrong-password') {
        return Future.error('Contraseña incorrecta');
      }
    }
  }
}
