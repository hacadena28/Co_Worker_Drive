import 'dart:ffi';

import 'package:coworkerdriver/domain/modelo/conductor.dart';
import 'package:coworkerdriver/ui/pages/navegador/menunav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../login/login.dart';

class PerfilConductor extends StatefulWidget {
  const PerfilConductor({super.key});

  @override
  State<PerfilConductor> createState() => _PerfilConductorState();
}

class _PerfilConductorState extends State<PerfilConductor> {
  @override
  TextEditingController controlnombres = TextEditingController();
  TextEditingController controlapellidos = TextEditingController();
  TextEditingController controlsexo = TextEditingController();
  TextEditingController controltelefono = TextEditingController();
  TextEditingController controlcorreo = TextEditingController();
  TextEditingController controlplacamoto = TextEditingController();
  TextEditingController controlclave = TextEditingController();
  var bandera = false;

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
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: DemoBottomAppBar(),
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
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverAppBar(expandedHeight: 200),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40.0, left: 20, right: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
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
                                    icon: Icon(
                                      Icons.update_rounded,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      showModalBottomSheet<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: 350,
                                            color: Colors.indigo[100],
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(11.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: <Widget>[
                                                    const Text(
                                                        'Actualizacion de Datos',
                                                        style: TextStyle(
                                                          color: Colors.indigo,
                                                          fontFamily:
                                                              'Montserrat',
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
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                                    TextField(
                                                      controller:
                                                          controlplacamoto,
                                                      enabled: true,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                                          Navigator.pop(
                                                              context),
                                                      style:
                                                          TextButton.styleFrom(
                                                              primary:
                                                                  Colors.white,
                                                              backgroundColor:
                                                                  Colors.green[
                                                                      600]),
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
            )
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.indigo,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            // child: Text(
            //   "Mi Perfil",
            //   style: TextStyle(
            //     color: Colors.amber,
            //     fontWeight: FontWeight.w700,
            //     fontSize: 23,
            //   ),
            // ),
          ),
        ),
        Positioned(
          top: expandedHeight / 7 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              child: SizedBox(
                height: expandedHeight,
                width: MediaQuery.of(context).size.width / 2,
                child: const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/profile.png',
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
