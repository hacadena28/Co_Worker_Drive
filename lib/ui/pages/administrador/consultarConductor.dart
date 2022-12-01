import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/controller/controladorConductor.dart';
import '../login/login.dart';
import '../navegador/menunavAdmin.dart';

class ConsulttarConductor extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    ConductorController controladorArticulo = Get.put(ConductorController());

    controladorArticulo.consultaArticulos().then((value) => null);

    return Scaffold(
      bottomNavigationBar: MenuAdministrador(),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Lista de Conductores',
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
                        leading: Icon(Icons.numbers_sharp),
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
