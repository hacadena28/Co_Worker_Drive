import 'package:coworkerdriver/ui/pages/maps/home_controller_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../navegador/menunavConductor.dart';

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
      bottomNavigationBar: DemoBottomAppBar(),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      body: GoogleMap(
        onMapCreated: _Controller.onMapCreated,
        initialCameraPosition: _initialCameraPosition,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
      ),
    );
  }
}
