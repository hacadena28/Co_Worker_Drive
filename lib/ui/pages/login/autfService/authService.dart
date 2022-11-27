import 'package:coworkerdriver/ui/pages/login/login.dart';
import 'package:coworkerdriver/ui/pages/login/registrarPasajero.dart';
import 'package:coworkerdriver/ui/pages/pasajero/perfilPasajero.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

class AuthService {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var prueba;
  var MiP;

  var user;
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        print(snapshot.hasData);

        if (snapshot.hasData) {
          return RegistrarPasajero();
        } else {
          prueba = 1;
          pruebaMensaje();
          // return Login();
          return Login();
        }
      },
    );
  }

  bool pruebaMensaje() {
    if (prueba == 1) {
      return true;
    }
    prueba = 0;
    return false;
  }

  signInWithGoogle() async {
    //const correo= FirebaseAuth.instance.currentUser!.email!;
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
    if (googleUser.email.contains("@unicesar.edu.co")) {
      print('-----------------inicio ----------------------------- ');
    } else {
      print("-------------No inicia-------------------" "$credential");
      prueba = 1;
      signOutGoogle();
      Get.to(() => Login());
    }
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
    //await _auth.signOut().then((Onvalue) => print('cerro session'));
    FirebaseAuth.instance.signOut();
    //FirebaseAuth.instance.signOut();
  }
}
