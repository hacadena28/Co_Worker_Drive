import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworkerdriver/domain/controller/controladorRuta.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/controller/controladorConductor.dart';
import '../login/login.dart';
import '../navegador/menunavAdmin.dart';

class ConsultarRutas extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    RutaController controladorRuta = Get.put(RutaController());
    controladorRuta.consultaRutas().then((value) => null);
    return Scaffold(
      bottomNavigationBar: MenuAdministrador(),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Lista de Rutas realizadas',
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
        () => controladorRuta.getArticulosGral?.isEmpty == false
            ? ListView.builder(
                itemCount: controladorRuta.getArticulosGral?.isEmpty == true
                    ? 0
                    : controladorRuta.getArticulosGral!.length,
                itemBuilder: (context, posicion) {
                  return ExpansionTile(
                    collapsedBackgroundColor: Colors.indigo.shade100,
                    backgroundColor: Colors.indigo[400],
                    textColor: Colors.white,
                    title: Text("Origen: " +
                        controladorRuta.getArticulosGral![posicion].origen),
                    subtitle: Text("Destino: " +
                        controladorRuta.getArticulosGral![posicion].destiono),
                    children: [
                      ListTile(
                        iconColor: Colors.white,
                        leading: Icon(Icons.money),
                        textColor: Colors.white,
                        title: Text(
                            controladorRuta.getArticulosGral![posicion].tarifa),
                        trailing: Container(
                          width: 80,
                          height: 40,
                          child: Center(
                            child: Text(controladorRuta
                                .getArticulosGral![posicion].estado),
                          ),
                        ),
                      ),
                      ListTile(
                        iconColor: Colors.white,
                        leading: Icon(Icons.book),
                        textColor: Colors.white,
                        title: Text(controladorRuta
                            .getArticulosGral![posicion].descripcion),
                      ),
                    ],
                  );
                })
            : const Icon(Icons.abc),
      ),
    );
  }
}
