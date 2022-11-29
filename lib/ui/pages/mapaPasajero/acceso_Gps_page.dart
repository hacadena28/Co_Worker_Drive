import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AccesoGps extends StatefulWidget {
  const AccesoGps({super.key});

  @override
  State<AccesoGps> createState() => _AccesoGpsState();
}

class _AccesoGpsState extends State<AccesoGps> with WidgetsBindingObserver {
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
      if (await Permission.location.isGranted) {
        Navigator.pushReplacementNamed(context, '/LoadingGps');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Es necesario el GPS para usa la app'),
            MaterialButton(
                child: Text(
                  'Solicitar Acceso',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.black,
                shape: StadiumBorder(),
                elevation: 0,
                splashColor: Colors.transparent,
                onPressed: () async {
                  // verificpo permisos
                  final status = await Permission.location.request();
                  this.accesoGps(status);
                })
          ],
        ),
      ),
    );
  }

  void accesoGps(PermissionStatus status) {
    switch(status) {
      case PermissionStatus.granted:
        Navigator.pushReplacementNamed(context, '/mapa');
        break;

      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
        openAppSettings();
    }
  }
}
