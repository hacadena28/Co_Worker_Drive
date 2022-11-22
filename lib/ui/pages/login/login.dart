import 'package:coworkerdriver/domain/controller/controladorAuth.dart';
import 'package:coworkerdriver/ui/pages/login/autfService/authService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

Controllerauthf controlf = Get.find();

class _LoginState extends State<Login> {
  TextEditingController controluser = TextEditingController();
  TextEditingController controlpassw = TextEditingController();
  var _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    AuthService().handleAuthState();
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10.0),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('B I E N V E N I D O',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 25.0)),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  IconButton(
                      onPressed: () {
                        if (controluser.text != "" && controlpassw.text != "") {
                          if (controluser.text == "admin" &&
                              controlpassw.text == "admin") {
                            Get.offAllNamed('/homeAdministrador');
                          } else {
                            Get.showSnackbar(const GetSnackBar(
                              title: 'Validacion Admin',
                              message:
                                  'Sus credenciales no son de tipo administrador',
                              icon: Icon(Icons.warning_amber_sharp),
                              duration: Duration(seconds: 4),
                              backgroundColor: Colors.red,
                            ));
                          }
                        } else {
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Validacion de Administrador',
                            message: 'Rellenar los campos',
                            icon: Icon(Icons.warning_amber_sharp),
                            duration: Duration(seconds: 4),
                            backgroundColor: Colors.red,
                          ));
                        }
                      },
                      icon: Icon(Icons.key)),
                ])
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.0),
                  topRight: Radius.circular(60.0)),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('INICIA SESION',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.amber,
                              fontSize: 20.0)),
                      SizedBox(width: 10.0),
                      SizedBox(
                        height: 250,
                        width: 350,
                        child: Image.asset('assets/logo.png'),
                      ),
                      TextField(
                        controller: controluser,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                          labelText: 'Ingrese correo electronico',
                          icon: Icon(
                            Icons.person,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20, // para dar espacio
                      ),
                      TextField(
                        controller: controlpassw,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            labelText: 'Ingrese Contraseña',
                            icon: Icon(Icons.password_rounded,
                                color: Colors.amber),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.indigo,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: ElevatedButton.icon(
                                icon: Icon(
                                  Icons.login,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  controlf
                                      .ingresarEmail(
                                          controluser.text, controlpassw.text)
                                      .then((value) {
                                    if (controlf.emailf != 'Sin Registro') {
                                      setState(() {
                                        Get.offAllNamed('/PerfilPasajero');
                                      });

                                      controlf.emailF("Sin Registro");
                                    } else {
                                      Get.showSnackbar(const GetSnackBar(
                                        title: 'Validacion de usarios',
                                        message:
                                            'Usuario no existe en la base de datos',
                                        icon: Icon(Icons.warning_amber_sharp),
                                        duration: Duration(seconds: 4),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  }).catchError((onError) {
                                    Get.showSnackbar(const GetSnackBar(
                                      title: 'Validacion de usarios',
                                      message: 'Datos Invalidos',
                                      icon: Icon(Icons.warning_amber_sharp),
                                      duration: Duration(seconds: 4),
                                      backgroundColor: Colors.red,
                                    ));
                                  });
                                },
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.green[600]),
                                label: Text("Iniciar Sesion")),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("¿No tienes una cuenta? ",
                                    style: TextStyle(
                                      color: Colors.indigo,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    )),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  AuthService().signInWithGoogle();
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Inicia Con Google",
                                      style: TextStyle(
                                        color: Colors.purple[400],
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
