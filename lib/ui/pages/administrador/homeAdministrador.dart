import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworkerdriver/ui/pages/administrador/consultarConductor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/controller/controladorPasajero.dart';
import '../login/login.dart';
import '../navegador/menunavAdmin.dart';

class HomeAdministrador extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    PasajeroController controladorArticulo = Get.put(PasajeroController());

    controladorArticulo.consultaArticulos().then((value) => null);

    return Scaffold(
      bottomNavigationBar: MenuAdministrador(),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Lista de Pasajeros',
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
                tooltip: 'Salir',
                onPressed: () {
                  Get.to(() => Login());
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
      body: Obx(
        () => controladorArticulo.getArticulosGral?.isEmpty == false
            ? ListView.builder(
                itemCount: controladorArticulo.getArticulosGral?.isEmpty == true
                    ? 0
                    : controladorArticulo.getArticulosGral!.length,
                itemBuilder: (context, posicion) {
                  return ExpansionTile(
                    collapsedBackgroundColor: Colors.indigo.shade100,
                    backgroundColor: Colors.indigo[400],
                    textColor: Colors.white,
                    title: Text(controladorArticulo
                        .getArticulosGral![posicion].nombres),
                    subtitle: Text(
                        controladorArticulo.getArticulosGral![posicion].correo),
                    children: [
                      ListTile(
                        iconColor: Colors.white,
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          width: 100,
                          height: 2000,
                          child: controladorArticulo
                                      .getArticulosGral![posicion].foto !=
                                  ''
                              ? Image.network(controladorArticulo
                                  .getArticulosGral![posicion].foto)
                              : const Icon(
                                  Icons.photo,
                                ),
                        ),
                        textColor: Colors.white,
                        title: Text(controladorArticulo
                            .getArticulosGral![posicion].telefono),
                        trailing: Container(
                          width: 80,
                          height: 40,
                          child: Center(
                            child: Text(controladorArticulo
                                .getArticulosGral![posicion].sexo),
                          ),
                        ),
                      ),
                    ],
                  );
                })
            : const Icon(Icons.abc),
      ),
    );
  }
}
