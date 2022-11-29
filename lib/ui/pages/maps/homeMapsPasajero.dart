import 'package:coworkerdriver/ui/pages/maps/home_controller_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../navegador/menunavConductor.dart';
import '../navegador/menunavPasajero.dart';

class HomeMApsPasajero extends StatelessWidget {
  const HomeMApsPasajero({Key? key}) : super(key: key);

 // Polyline _miRuta = new Polyline(polylineId: PolylineId(''));

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Mapa_controller>(
      
      create: (_) {
        final controller = Mapa_controller();
        controller.onMarkerTap.listen((String id) {
          print("IR A $id");
        });
        return controller;
      },
      child: Scaffold(
        bottomNavigationBar: DemoBottomAppBarPasajero(),
        body: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.91,
                child: Consumer<Mapa_controller>(
                  builder: (_, Controller, __) => GoogleMap(
                    zoomControlsEnabled: false,
                    onMapCreated: Controller.onMapCreated,
                    initialCameraPosition: Controller.initialCameraPosition,
                    myLocationButtonEnabled: true,
                    mapType: MapType.normal,
                    markers: Controller.markers,
                    myLocationEnabled: true,
                    

                    onTap: Controller.onTap,

                    // Expanded(
                    //   child: SizedBox(
                    //     width: MediaQuery.of(context).size.width * 1,
                    //     height: MediaQuery.of(context).size.height * 0.91,
                    //     child: GoogleMap(
                    //       zoomControlsEnabled: false,
                    //       onMapCreated: _Controller.onMapCreated,
                    //       initialCameraPosition: _initialCameraPosition,
                    //       myLocationButtonEnabled: true,
                    //       mapType: MapType.normal,
                    //     ),
                  ),
                )),
          ],
        ),
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
                      padding: const EdgeInsets.all(11.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          const Text('Escoge tu ruta',
                              style: TextStyle(
                                color: Colors.indigo,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            enabled: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                              ),
                              labelText: 'Origen',
                              icon: Icon(
                                Icons.place,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            enabled: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                              ),
                              labelText: 'Destino',
                              icon: Icon(
                                Icons.place_outlined,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            enabled: true,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                              ),
                              labelText: 'Tarifa',
                              icon: Icon(
                                Icons.money,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
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
