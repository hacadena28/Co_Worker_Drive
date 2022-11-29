import 'package:coworkerdriver/helpers/helpers.dart';
import 'package:coworkerdriver/ui/pages/mapaPasajero/acceso_Gps_page.dart';
import 'package:coworkerdriver/ui/pages/mapaPasajero/mapa_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadingGps extends StatefulWidget {
  const LoadingGps({super.key});

  @override
  State<LoadingGps> createState() => _LoadingGpsState();
}

class _LoadingGpsState extends State<LoadingGps> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (await Geolocator.isLocationServiceEnabled()) {
        Navigator.pushReplacement(context, navegarMapaFadeIn(context, Mapa()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: this.checkGpsLocation(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            return Center(
              child: Text(snapshot.data),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              strokeWidth: 3,
            ));
          }
        },
      ),
    );
  }

  Future checkGpsLocation(BuildContext context) async {
    // permiso gps
    final permisoGps = await Permission.location.isGranted;
    // gps activo
    final gpsActivo = await Geolocator.isLocationServiceEnabled();

    if (permisoGps && gpsActivo) {
      Navigator.pushReplacement(context, navegarMapaFadeIn(context, Mapa()));
      return '';
    } else if (!permisoGps) {
      Navigator.pushReplacement(
          context, navegarMapaFadeIn(context, AccesoGps()));
      return 'es necesario el permiso para el Gps';
    } else {
      return 'Por favor activar el GPS';
    }
  }
}
