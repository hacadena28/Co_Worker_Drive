import 'package:coworkerdriver/ui/pages/conductor/perfilConductor.dart';
import 'package:coworkerdriver/ui/pages/login/registrarConductor.dart';
import 'package:coworkerdriver/ui/pages/login/registrarPasajero.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login/home-pages.dart';
import 'login/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Crud clientes',
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => Login(),
        '/rol': (context) => MyHomePage(),
        '/loginConductor': (context) => const RegistrarConductor(),
        '/loginPasajero': (context) => const RegistrarPasajero(),
        '/perfilConductor': (context) => PerfilConductor(),
      },
      home: Login(),
    );
  }
}
