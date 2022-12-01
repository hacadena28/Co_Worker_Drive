import 'package:coworkerdriver/ui/pages/administrador/homeAdministrador.dart';
import 'package:coworkerdriver/ui/pages/conductor/homeConductor.dart';
import 'package:coworkerdriver/ui/pages/conductor/perfilConductor.dart';
import 'package:coworkerdriver/ui/pages/login/autfService/authService.dart';
import 'package:coworkerdriver/ui/pages/login/presentacion.dart';
import 'package:coworkerdriver/ui/pages/login/registrarConductor.dart';
import 'package:coworkerdriver/ui/pages/login/registrarPasajero.dart';
import 'package:coworkerdriver/ui/pages/mapaPasajero/homeMapsPasajero.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'administrador/consultarConductor.dart';
import 'administrador/consultarRutas.dart';
import 'login/home-pages.dart';
import 'login/login.dart';

import 'mapsConductor/homeMapsConductor.dart';
import 'pasajero/homePasajero.dart';
import 'pasajero/perfilPasajero.dart';

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
        '/registrarPasajero': (context) => const RegistrarPasajero(),
        '/perfilConductor': (context) => PerfilConductor(),
        '/PerfilPasajero': (context) => PerfilPasajero(),
        '/homePasajero': (context) => homePasajero(),
        '/homeConductor': (context) => homeConductor(),
        '/presentacion': (context) => Presentacion(),
        '/homeAdministrador': (context) => HomeAdministrador(),
        '/HomeMApsPasajero': (context) => HomeMApsPasajero(),
        '/HomeMApsConductor': (context) => HomeMApsConductor(),
        '/consultarConductor': (context) => ConsulttarConductor(),
        '/ConsultarRutas': (context) => ConsultarRutas(),
        '/validarC': (context) => AuthService().handleAuthState(),
        '/RegistrarC': (context) => AuthService().handleAuthState(),
      },
      home: Presentacion(),
      // home: AuthService().handleAuthState(),
    );
  }
}
