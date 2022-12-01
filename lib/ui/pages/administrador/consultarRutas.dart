import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/controller/controladorConductor.dart';
import '../login/login.dart';
import '../navegador/menunavAdmin.dart';

class ConsultarRutas extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
