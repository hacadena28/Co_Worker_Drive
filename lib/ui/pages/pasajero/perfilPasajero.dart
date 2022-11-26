import 'package:coworkerdriver/ui/pages/login/autfService/authService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login/home-pages.dart';
import '../login/login.dart';
import '../navegador/menunavPasajero.dart';

class PerfilPasajero extends StatefulWidget {
  const PerfilPasajero({
    super.key,
  });

  @override
  State<PerfilPasajero> createState() => _PerfilPasajeroState();
}

class _PerfilPasajeroState extends State<PerfilPasajero> {
  TextEditingController controlnombres = TextEditingController();
  TextEditingController controltelefono = TextEditingController();
  TextEditingController controlcorreo = TextEditingController();
  TextEditingController controlsexo = TextEditingController();

  @override
  void initState() {
    PerfilPasajero();
    try {
      var imagen;
      var catalogo = <String, dynamic>{
        'nombres': controlnombres.text =
            FirebaseAuth.instance.currentUser!.displayName!,
        'sexo': controlsexo.text = "F",
        'correo': controlcorreo.text =
            FirebaseAuth.instance.currentUser!.email!,
        'foto': "",
        'telefono': controltelefono.text =
            FirebaseAuth.instance.currentUser!.phoneNumber!,
      };
    } catch (e) {
      print("Este es mi error");

      print(e);
    }
  }

  set controlf(String controlf) {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo,
        bottomNavigationBar: DemoBottomAppBarPasajero(),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Perfil',
              style: TextStyle(
                color: Colors.amber,
                fontFamily: 'Montserrat',
                fontSize: 20,
              ),
            ),
          ),
          backgroundColor: Colors.indigo,
          actions: <Widget>[
            Row(
              children: [
                IconButton(
                  tooltip: 'Cambiar Rol',
                  onPressed: () {
                    Get.to(() => MyHomePage());
                  },
                  icon: const Icon(
                    Icons.motorcycle,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  tooltip: 'Cerrar Sesion',
                  onPressed: () {
                    AuthService().signOutGoogle();
                    Get.to(() => Login());
                    //   controlf = "Sin registrar";
                  },
                  icon: const Icon(
                    Icons.output_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10.0),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Center(
                        child: GestureDetector(
                          child: CircleAvatar(
                            radius: 90,
                            // aqui tengo la foto de mi usuario de google

                            backgroundImage: AssetImage(
                              "assets/ella.png",
                            ),
                            //     FirebaseAuth.instance.currentUser!.photoURL!),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        enabled: false,
                        controller: controlnombres,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          labelText: 'Nombres',
                          icon: Icon(
                            Icons.person,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: controltelefono,
                        enabled: false,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          labelText: 'Telefono',
                          icon: Icon(
                            Icons.numbers_rounded,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: controlcorreo,
                        enabled: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          labelText: 'Correo Electronico Institucional',
                          icon: Icon(
                            Icons.email_outlined,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: controlsexo,
                        enabled: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                          labelText: 'Sexo',
                          icon: Icon(
                            Icons.wc_rounded,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton.icon(
                                // MODAL DE ACTUALIZACION DE DATOS
                                icon: Icon(
                                  Icons.update_rounded,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  // var catalogo = <String, dynamic>{};

// modal
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 350,
                                        color: Colors.transparent,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(11.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                const Text(
                                                    'Actualizacion de Datos',
                                                    style: TextStyle(
                                                      color: Colors.indigo,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.0,
                                                    )),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                TextField(
                                                  enabled: true,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        15,
                                                      ),
                                                    ),
                                                    labelText: 'Telefono',
                                                    icon: Icon(
                                                      Icons.numbers_outlined,
                                                      color: Colors.amber,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                ElevatedButton(
                                                  child: const Text(
                                                      'Guardar Cambios'),
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  style: TextButton.styleFrom(
                                                      primary: Colors.white,
                                                      backgroundColor:
                                                          Colors.green[600]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.green[600]),
                                label: Text("Modificar Perfil")),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
