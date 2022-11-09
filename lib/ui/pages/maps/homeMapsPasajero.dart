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
        onPressed: () {},
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
