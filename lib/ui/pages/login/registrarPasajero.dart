import 'dart:io';

import 'package:coworkerdriver/data/services/peticionFirebaseAuthPasajero.dart';
import 'package:coworkerdriver/domain/controller/controladorAuth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegistrarPasajero extends StatefulWidget {
  const RegistrarPasajero({super.key});

  @override
  State<RegistrarPasajero> createState() => _RegistrarPasajeroState();
}

class _RegistrarPasajeroState extends State<RegistrarPasajero> {
  TextEditingController controlnombres = TextEditingController();
  TextEditingController controlapellidos = TextEditingController();
  TextEditingController controlsexo = TextEditingController();
  TextEditingController controltelefono = TextEditingController();
  TextEditingController controlcorreo = TextEditingController();
  TextEditingController controlusuario = TextEditingController();
  TextEditingController controlclave = TextEditingController();
  TextEditingController controlconfirmarclave = TextEditingController();
  final sexo = ["Masculino", "Femenino", "Otros"];
  String? selectSexo;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 1.0, left: 5.0),
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
                        Get.offAllNamed('/login');
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
                  child: Text('P A S A J E R O',
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
              child: Expanded(
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
                    DropdownButtonFormField(
                      value: selectSexo,
                      items: sexo
                          .map(
                            (e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          selectSexo = val as String;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.amber,
                      ),
                      dropdownColor: Colors.amber[50],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        labelText: 'Sexo',
                        icon: Icon(
                          Icons.wc,
                          color: Colors.amber,
                        ),
                      ),
                    ),
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
                          Icons.phone,
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
                          Icons.mail,
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
                          Icons.password,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: controlconfirmarclave,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        labelText: 'Confirmar Clave',
                        icon: Icon(
                          Icons.password,
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
                                if (validarCamposvasios()) {
                                  if (controlclave.text ==
                                      controlconfirmarclave.text) {
                                    var catalogo = <String, dynamic>{
                                      'nombres': controlnombres.text,
                                      'apellidos': controlapellidos.text,
                                      'sexo': selectSexo,
                                      'telefono': controltelefono.text,
                                      'correo': controlcorreo.text,
                                      'clave': controlclave.text,
                                      'foto': "",
                                    };
                                    controlf
                                        .registraEmail(controlcorreo.text,
                                            controlclave.text)
                                        .then((Value) {
                                      if (controlf.emailf != "Sin registro") {
                                        // Get.offAllNamed('/listarArticulos');
                                        PeticionesPasajero.crearPasajero(
                                            catalogo, _image);
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
                                  } else {
                                    Get.showSnackbar(const GetSnackBar(
                                      title: "Contraseña",
                                      message: "Contraseñas no coinciden",
                                      icon: Icon(Icons.warning_amber_sharp),
                                      duration: Duration(seconds: 4),
                                      backgroundColor:
                                          Color.fromARGB(255, 213, 136, 130),
                                    ));
                                  }
                                } else {
                                  Get.showSnackbar(const GetSnackBar(
                                    title: "ADVERTENCIA",
                                    message:
                                        "Por favor rellene todos los campos",
                                    icon: Icon(Icons.warning_amber_sharp),
                                    duration: Duration(seconds: 4),
                                    backgroundColor:
                                        Color.fromARGB(255, 213, 136, 130),
                                  ));
                                }
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

  bool validarCamposvasios() {
    if (controlnombres.text.isNotEmpty &&
        controlapellidos.text.isNotEmpty &&
        controltelefono.text.isNotEmpty &&
        controlcorreo.text.isNotEmpty &&
        controlclave.text.isNotEmpty) {
      return true;
    }
    return false;
  }
}
