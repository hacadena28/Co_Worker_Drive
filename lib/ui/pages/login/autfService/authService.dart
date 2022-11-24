import 'package:coworkerdriver/ui/pages/login/login.dart';
import 'package:coworkerdriver/ui/pages/pasajero/perfilPasajero.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  var user;
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return PerfilPasajero();
        } else {
          return Login();
        }
      },
    );
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

    if (googleUser.email == "lauradayana87@gmail.com") {
      print('-----------------este es mi correo ');
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      print("-------------No ingreso" "$googleUser");
    }
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
    //FirebaseAuth.instance.signOut();
  }
}
