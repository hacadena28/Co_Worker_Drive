import 'dart:io';

import 'package:coworkerdriver/ui/pages/navegador/menunavConductor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/services/peticionFirebaseAuthConductor.dart';
import '../login/home-pages.dart';
import '../login/login.dart';

class PerfilConductor extends StatefulWidget {
  const PerfilConductor({
    super.key,
    /*required this.gestionConductor*/
  });
  // final Conductor gestionConductor;

  @override
  State<PerfilConductor> createState() => _PerfilConductorState();
}

class _PerfilConductorState extends State<PerfilConductor> {
  var _image;
  ImagePicker picker = ImagePicker();
  TextEditingController controlnombres = TextEditingController();
  TextEditingController controlapellidos = TextEditingController();
  TextEditingController controlsexo = TextEditingController();
  TextEditingController controltelefono = TextEditingController();
  TextEditingController controlcorreo = TextEditingController();
  TextEditingController controlplacamoto = TextEditingController();
  TextEditingController controlclave = TextEditingController();
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();
  TextEditingController c6 = TextEditingController();
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();
  FocusNode f6 = FocusNode();
  // ignore: must_call_super
  void initState() {
  }

  // void initState() {
  //   controlnombres.text = widget.gestionConductor.nombres;
  //   controlapellidos.text = widget.gestionConductor.apellidos;
  //   controlsexo.text = widget.gestionConductor.sexo;
  //   controltelefono = widget.gestionConductor.telefono;
  //   controlcorreo = widget.gestionConductor.correo;
  //   controlplacamoto = widget.gestionConductor.placaMoto;
  //   controlclave = widget.gestionConductor.clave;

  //   super.initState();
  // }

  var bandera = false;
  _camGaleria(bool op) async {
    XFile? image;
    image = op
        ? await picker.pickImage(source: ImageSource.camera, imageQuality: 50)
        : await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = (image != null) ? File(image.path) : null;
    });
  }

  set controlf(String controlf) {}

/*
  PerfilConductor(Conductor usuario) {
    controlnombres.text = usuario.nombres.toString();
    controlapellidos.text = usuario.apellidos.toString();
    controlsexo.text = usuario.sexo.toString();
    controltelefono.text = usuario.telefono.toString();
    controlcorreo.text = usuario.correo.toString();
    controlplacamoto.text = usuario.placaMoto.toString();
  }
  */
  @override
  Widget build(BuildContext context) {
    double largo = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo,
        bottomNavigationBar: DemoBottomAppBar(),
        //  drawer: Drawer(),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Datos del conductor',
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
                    Get.to(() => Login());
                    controlf = "Sin registrar";
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
                    TextField(
                      controller: controlplacamoto,
                      enabled: false,
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
                      height: 30,
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
                                  'nombres': controlnombres.text,
                                  'apellidos': controlapellidos.text,
                                  'sexo': controlsexo.text,
                                  'telefono': controltelefono.text,
                                  'correo': controlcorreo.text,
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
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Expanded(
                                                    child: TextField(
                                                      onChanged: (value) =>
                                                          FocusScope.of(context)
                                                              .requestFocus(f2),
                                                      focusNode: f1,
                                                      controller: c1,
                                                      maxLength: 1,
                                                      textAlign:
                                                          TextAlign.center,
                                                      decoration:
                                                          const InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              hintText: '0',
                                                              counterText: "",
                                                              hintStyle: TextStyle(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: largo * 0.01,
                                                  ),
                                                  Expanded(
                                                    child: TextField(
                                                      onChanged: (value) =>
                                                          FocusScope.of(context)
                                                              .requestFocus(f3),
                                                      focusNode: f2,
                                                      controller: c2,
                                                      maxLength: 1,
                                                      textAlign:
                                                          TextAlign.center,
                                                      decoration:
                                                          const InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              hintText: '0',
                                                              counterText: "",
                                                              hintStyle: TextStyle(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: largo * 0.01,
                                                  ),
                                                  Expanded(
                                                    child: TextField(
                                                      onChanged: (value) =>
                                                          FocusScope.of(context)
                                                              .requestFocus(f4),
                                                      focusNode: f3,
                                                      controller: c3,
                                                      maxLength: 1,
                                                      textAlign:
                                                          TextAlign.center,
                                                      decoration:
                                                          const InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              hintText: '0',
                                                              counterText: "",
                                                              hintStyle: TextStyle(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: largo * 0.01,
                                                  ),
                                                  Expanded(
                                                    child: TextField(
                                                      onChanged: (value) {
                                                        FocusScope.of(context)
                                                            .requestFocus(f5);
                                                      },
                                                      focusNode: f4,
                                                      controller: c4,
                                                      maxLength: 1,
                                                      textAlign:
                                                          TextAlign.center,
                                                      decoration:
                                                          const InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              hintText: '0',
                                                              counterText: "",
                                                              hintStyle: TextStyle(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: largo * 0.01,
                                                  ),
                                                  Expanded(
                                                    child: TextField(
                                                      onChanged: (value) =>
                                                          setState(() {}),
                                                      focusNode: f5,
                                                      controller: c5,
                                                      maxLength: 1,
                                                      textAlign:
                                                          TextAlign.center,
                                                      decoration:
                                                          const InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              hintText: '0',
                                                              counterText: "",
                                                              hintStyle: TextStyle(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              TextField(
                                                controller: controlplacamoto,
                                                enabled: true,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      15,
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
