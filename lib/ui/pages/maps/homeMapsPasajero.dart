import 'package:coworkerdriver/ui/pages/maps/home_controller_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../navegador/menunavConductor.dart';
import '../navegador/menunavPasajero.dart';

class HomeMApsPasajero extends StatefulWidget {
  const HomeMApsPasajero({super.key});

  @override
  State<HomeMApsPasajero> createState() => _HomeMApsState();
}

class _HomeMApsState extends State<HomeMApsPasajero> {
  final _Controller = Mapa_controller();
  final _initialCameraPosition = CameraPosition(
    target: LatLng(10.450254, -73.260486),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DemoBottomAppBarPasajero(),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.91,
            child: GoogleMap(
              zoomControlsEnabled: false,
              onMapCreated: _Controller.onMapCreated,
              initialCameraPosition: _initialCameraPosition,
              myLocationButtonEnabled: true,
              mapType: MapType.normal,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 350,
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
          "Where are you going?",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        icon: Icon(Icons.navigation),
      ),
    );
  }
}
