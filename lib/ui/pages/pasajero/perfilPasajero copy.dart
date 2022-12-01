
import 'package:coworkerdriver/domain/modelo/conductor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/services/peticionFirebaseAuthConductor.dart';
import '../login/home-pages.dart';
import '../navegador/menunavPasajero.dart';

class PerfilPasajero2 extends StatefulWidget {
  const PerfilPasajero2({
    super.key,
    /*required this.gestionConductor*/
  });
  // final Conductor gestionConductor;

  @override
  State<PerfilPasajero2> createState() => _PerfilPasajero2State();
}

class _PerfilPasajero2State extends State<PerfilPasajero2> {
  var _image;
  ImagePicker picker = ImagePicker();
  TextEditingController controlnombres = TextEditingController();
  TextEditingController controlapellidos = TextEditingController();
  TextEditingController controlsexo = TextEditingController();
  TextEditingController controltelefono = TextEditingController();
  TextEditingController controlcorreo = TextEditingController();
  TextEditingController controlplacamoto = TextEditingController();
  TextEditingController controlclave = TextEditingController();
  @override
  // ignore: must_call_super
  void initState() {
  }

  // void initState() {

  //   controlapellidos.text = widget.gestionConductor.apellidos;
  //   controlsexo.text = widget.gestionConductor.sexo;
  //   controltelefono = widget.gestionConductor.telefono;
  //   controlcorreo = widget.gestionConductor.correo;
  //   controlplacamoto = widget.gestionConductor.placaMoto;
  //   controlclave = widget.gestionConductor.clave;

  //   super.initState();
  // }

  var bandera = false;
  var nom = 'Lau';

  set controlf(String controlf) {}

  PerfilPasajero2(Conductor usuario) {
    controlnombres.text = "hola mundo";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo,
        bottomNavigationBar: DemoBottomAppBarPasajero(),
        //  drawer: Drawer(),
        appBar: AppBar(
          
          title: Center(
            child: Text(
              'Datos Personales',
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
                  tooltip: 'Rol',
                  onPressed: () {
                    Get.to(() => MyHomePage());
                  },
                  icon: const Icon(
                    Icons.motorcycle,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  tooltip: 'Salir',
                  onPressed: () {
                    //AuthService().signOut();
                    //  Get.to(() => Login());
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
              padding: const EdgeInsets.only(top: 15.0, left: 10.0),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70.0),
                    topRight: Radius.circular(70.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Column(
                  children: [
                    Center(
                      child: GestureDetector(
                        // onTap: () async {
                        //   _opcioncamara(context);
                        // },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.blue,
                          backgroundImage: NetworkImage(
                              FirebaseAuth.instance.currentUser!.photoURL!),
                          // child: _image != null
                          //     ? ClipRRect(
                          //         borderRadius: BorderRadius.circular(48),
                          //         child: Image.file(
                          //           _image,
                          //           width: 100,
                          //           height: 100,
                          //           fit: BoxFit.fitHeight,
                          //         ),
                          //       )
                          //     : Container(
                          //         decoration: BoxDecoration(
                          //           color: Colors.blue,
                          //           borderRadius: BorderRadius.circular(48),
                          //         ),
                          //         width: 100,
                          //         height: 100,
                          //         child: const Icon(
                          //           Icons.camera_alt_outlined,
                          //           color: Colors.white,
                          //         ),
                          //       ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      enabled: false,
                      controller: controlnombres,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            30,
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
                      controller: controlapellidos,
                      enabled: false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        labelText: 'Apellidos',
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
                            30,
                          ),
                        ),
                        labelText: 'Telefono',
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
                      controller: controlcorreo,
                      enabled: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        labelText: 'Correo Electronico',
                        icon: Icon(
                          Icons.person,
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
                                var catalogo = <String, dynamic>{
                                  'nombres': controlnombres.text =
                                      "Heli ALberto",
                                  'apellidos': controlapellidos.text =
                                      "Cadena Arenilla",
                                  'sexo': controlsexo.text,
                                  'telefono': controltelefono.text =
                                      "3206870778",
                                  'correo': controlcorreo.text = "hc@gmail.com",
                                  'clave': controlclave.text,
                                  'foto': "",
                                };
                                PeticionesConductor.crearConductor(
                                    catalogo, _image);

                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 350,
                                      color: Colors.indigo[100],
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
                                                    fontWeight: FontWeight.bold,
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
                                                    Icons.person,
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
          ],
        ),
      ),
    );
  }

}
