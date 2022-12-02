import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworkerdriver/ui/pages/mapsConductor/home_controller_maps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../domain/controller/controladorRuta.dart';
import '../navegador/menunavConductor.dart';
import '../navegador/menunavPasajero.dart';

class HomeMApsConductor extends StatefulWidget {
  final db = FirebaseFirestore.instance;
  @override
  State<HomeMApsConductor> createState() => _HomeMApsConductorState();
}

class _HomeMApsConductorState extends State<HomeMApsConductor> {
  // Polyline _miRuta = new Polyline(polylineId: PolylineId(''));
  TextEditingController controlDestino = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RutaController controladorRuta = Get.put(RutaController());
    controladorRuta.consultaRutas().then((value) => null);
    return ChangeNotifierProvider<Mapa_controller>(
      create: (_) {
        final controller = Mapa_controller();
        controller.onMarkerTap.listen((String id) {
          print("IR A $id");
          controlDestino.text = id;
        });
        return controller;
      },
      child: Scaffold(
        appBar: AppBar(actions: [
          Stack(
            children: [
              Badge(
                badgeContent: Text('3'),
                padding: EdgeInsets.all(10),
                badgeColor: Colors.redAccent,
                animationType: BadgeAnimationType.slide,
                position: BadgePosition.topStart(),
                child: Icon(Icons.notifications, size: 40),
              ),
            ],
          ),
        ]),
        bottomNavigationBar: DemoBottomAppBar(),
        body: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Consumer<Mapa_controller>(
                  builder: (_, Controller, __) => GoogleMap(
                      zoomControlsEnabled: false,
                      onMapCreated: Controller.onMapCreated,
                      initialCameraPosition: Controller.initialCameraPosition,
                      myLocationButtonEnabled: true,
                      mapType: MapType.normal,
                      markers: Controller.markers,
                      trafficEnabled: true,
                      myLocationEnabled: true,
                      onTap: Controller.onTap),
                )),
            SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const Text('Datos de la Ruta  a Seguir',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    enabled: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Origen',
                      icon: Icon(
                        Icons.place,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    enabled: true,
                    controller: controlDestino,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Destino',
                      icon: Icon(
                        Icons.place_outlined,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    enabled: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Tarifa',
                      icon: Icon(
                        Icons.money,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    enabled: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Descripcion',
                      icon: Icon(
                        Icons.description_rounded,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    child: const Text(' Servicio Terminado'),
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.green[600]),
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
