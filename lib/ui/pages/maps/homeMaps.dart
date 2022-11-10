import 'package:coworkerdriver/ui/pages/maps/home_controller_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../navegador/menunavConductor.dart';

class HomeMAps extends StatefulWidget {
  const HomeMAps({super.key});

  @override
  State<HomeMAps> createState() => _HomeMApsState();
}

class _HomeMApsState extends State<HomeMAps> {
  final _Controller = Mapa_controller();
  final _initialCameraPosition = CameraPosition(
    target: LatLng(10.450254, -73.260486),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DemoBottomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              //height: MediaQuery.of(context).size.height * 0.933,
              child: GoogleMap(
                zoomControlsEnabled: false,
                onMapCreated: _Controller.onMapCreated,
                initialCameraPosition: _initialCameraPosition,
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 450,
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
                          enabled: false,
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
                          enabled: false,
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
                          enabled: false,
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
                        TextField(
                          enabled: true,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            labelText: 'Contra oferta',
                            icon: Icon(
                              Icons.money,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    ElevatedButton(
                                      child: const Text('Aceptar Servicio'),
                                      onPressed: () => Navigator.pop(context),
                                      style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Colors.green[600]),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Column(
                                  children: [
                                    ElevatedButton(
                                      child: const Text('Contra Oferta'),
                                      onPressed: () => Navigator.pop(context),
                                      style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Colors.green[600]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
          "Aceptar Servicio",
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
