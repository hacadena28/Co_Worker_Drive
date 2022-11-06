import 'package:coworkerdriver/domain/controller/controladoruser.dart';
import 'package:coworkerdriver/domain/modelo/conductor.dart';
import 'package:coworkerdriver/ui/pages/conductor/homeConductor.dart';
import 'package:coworkerdriver/ui/pages/conductor/perfilConductor.dart';
import 'package:coworkerdriver/ui/pages/login/registrarConductor.dart';
import 'package:coworkerdriver/ui/pages/login/registrarPasajero.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login/home-pages.dart';
import 'login/login.dart';
import 'maps/homeMaps.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Co-workerDrive',
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => Login(),
        '/rol': (context) => MyHomePage(),
        '/loginConductor': (context) => const RegistrarConductor(),
        '/loginPasajero': (context) => const RegistrarPasajero(),
        '/perfilConductor': (context) => PerfilConductor(),
        '/homeMaps': (context) => HomeMAps(),
      },
      home: Login(),
    );
  }
}
