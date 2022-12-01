import 'package:badges/badges.dart';
import 'package:coworkerdriver/ui/pages/mapsConductor/home_controller_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../navegador/menunavPasajero.dart';

class HomeMApsPasajero extends StatefulWidget {
  @override
  State<HomeMApsPasajero> createState() => _HomeMApsPasajeroState();
}

class _HomeMApsPasajeroState extends State<HomeMApsPasajero> {
  // Polyline _miRuta = new Polyline(polylineId: PolylineId(''));
  TextEditingController controlDestino = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        bottomNavigationBar: DemoBottomAppBarPasajero(),
        body: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.82,
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
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.width * 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.indigo[100],
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          const Text('Escoge tu Ruta ',
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
                            child: const Text('Solicitar Servicio'),
                            onPressed: () => Navigator.pop(context),
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.green[600]),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          label: const Text(
            "Solicitar Servicio",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          icon: Icon(Icons.navigation),
        ),
      ),
    );
  }
}
