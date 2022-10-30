import 'dart:io';

import 'package:coworkerdriver/domain/controller/controladorAuth.dart';
import 'package:coworkerdriver/domain/modelo/conductor.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/services/peticionFirebaseAuthConductor.dart';

class RegistrarConductor extends StatefulWidget {
  const RegistrarConductor({super.key});

/*   var nombres;
  var apellidos;
  var sexo;
  var telefono;
  var correo;
  var placaMoto;
  var usuario;
  var clave;
*/

  @override
  State<RegistrarConductor> createState() => _RegistrarConductorState();
}

class _RegistrarConductorState extends State<RegistrarConductor> {
  TextEditingController controlnombres = TextEditingController();
  TextEditingController controlapellidos = TextEditingController();
  TextEditingController controlsexo = TextEditingController();
  TextEditingController controltelefono = TextEditingController();
  TextEditingController controlcorreo = TextEditingController();
  TextEditingController controlplacamoto = TextEditingController();
  TextEditingController controlusuario = TextEditingController();
  TextEditingController controlclave = TextEditingController();
  Controllerauthf controlf = Get.find();
  var _image;
  ImagePicker picker = ImagePicker();
  _camGaleria(bool op) async {
    XFile? image;
    image = op
        ? await picker.pickImage(source: ImageSource.camera, imageQuality: 50)
        : await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = (image != null) ? File(image.path) : null;
    });
  }

  final List<String> items = [
    'F',
    'M',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 1.0, left: 10.0),
          ),
          SizedBox(height: 6.0),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.offAllNamed('/rol');
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('C o n d u c t o r',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30.0)),
                ),
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
              boxShadow: [
                new BoxShadow(
                  color: Colors.indigo.shade900,
                  spreadRadius: 12,
                  blurRadius: 15,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        _opcioncamara(context);
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blue,
                        child: _image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(48),
                                child: Image.file(
                                  _image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(48),
                                ),
                                width: 100,
                                height: 100,
                                child: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
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
                    height: 10,
                  ),
                  TextField(
                    controller: controlapellidos,
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
                    height: 10,
                  ),
                  TextField(
                    controller: controlsexo,
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
                  // DropdownButtonHideUnderline(
                  //     child: Center(
                  //   child: DropdownButton2(
                  //     isExpanded: true,
                  //     hint: Row(
                  //       children: const [
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 7, right: 18),
                  //           child: Icon(
                  //             Icons.list,
                  //             size: 28,
                  //             color: Colors.amber,
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 4,
                  //         ),
                  //         Center(
                  //           child: Expanded(
                  //             child: Padding(
                  //               padding: EdgeInsets.only(left: 15.0),
                  //               child: Text(
                  //                 'selecciona el sexo',
                  //                 style: TextStyle(
                  //                   fontSize: 20,
                  //                   //fontWeight: FontWeight.bold,
                  //                   color: Colors.black,
                  //                 ),
                  //                 overflow: TextOverflow.ellipsis,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     items: items
                  //         .map(
                  //           (item) => DropdownMenuItem<String>(
                  //             value: item,
                  //             child: Text(
                  //               item,
                  //               style: const TextStyle(
                  //                 fontSize: 14,
                  //               ),
                  //             ),
                  //           ),
                  //         )
                  //         .toList(),
                  //     value: selectedValue,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         selectedValue = value as String;
                  //       });
                  //     },
                  //   ),
                  // )),

                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controltelefono,
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
                    height: 10,
                  ),
                  TextField(
                    controller: controlcorreo,
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
                    height: 10,
                  ),
                  TextField(
                    controller: controlplacamoto,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      labelText: 'placa moto',
                      icon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  TextField(
                    controller: controlclave,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      labelText: 'Clave',
                      icon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.login,
                              size: 20,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // Conductor conductor = new Conductor();
                              // conductor.nombres = controlnombres.text;
                              // conductor.apellidos = controlapellidos.text;
                              // conductor.sexo =
                              //     items; // no se como capturar el dato del select
                              // conductor.telefono = controltelefono.text;
                              // conductor.correo = controlcorreo.text;
                              // conductor.placaMoto = controlplacamoto.text;
                              // conductor.clave = controlclave.text;
                              // listaConductores.add(conductor);
                              var catalogo = <String, dynamic>{
                                'nombres': controlnombres.text,
                                'apellidos': controlapellidos.text,
                                'sexo': controlsexo.text,
                                'telefono': controltelefono.text,
                                'correo': controlcorreo.text,
                                'placaMoto': controlplacamoto.text,
                                'clave': controlclave.text,
                                'foto': "",
                              };

                              PeticionesConductor.crearConductor(
                                  catalogo, _image);
                              controlf
                                  .registraEmail(
                                      controlcorreo.text, controlclave.text)
                                  .then((Value) {
                                if (controlf.emailf != "Sin registro") {
                                  // Get.offAllNamed('/listarArticulos');
                                  Get.showSnackbar(const GetSnackBar(
                                    title: "Felicidades",
                                    message: "Usuario Registrado",
                                    icon: Icon(Icons.warning_amber_sharp),
                                    duration: Duration(seconds: 4),
                                    backgroundColor:
                                        Color.fromARGB(255, 66, 231, 11),
                                  ));
                                  Get.offAllNamed('/login');
                                }
                              }).catchError((onError) {
                                Get.showSnackbar(const GetSnackBar(
                                  title: "Validacion de usuarios",
                                  message: "Usuario ya esta registrado",
                                  icon: Icon(Icons.warning_amber_sharp),
                                  duration: Duration(seconds: 4),
                                  backgroundColor:
                                      Color.fromARGB(255, 213, 136, 130),
                                ));
                              });
                            },
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.green[600]),
                            label: Text("Registrar")),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _opcioncamara(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Imagen de Galeria'),
                    onTap: () {
                      _camGaleria(false);
                      Get.back();
                      // Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Capturar Imagen'),
                  onTap: () {
                    _camGaleria(true);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
}
