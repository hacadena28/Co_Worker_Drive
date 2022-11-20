import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'utils/mapSatyle.dart';

class Mapa_controller extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();

  final _markersController = StreamController<String>.broadcast();
  Stream<String> get onMarkerTap => _markersController.stream; 

  final initialCameraPosition = CameraPosition(
    target: LatLng(10.450254, -73.260486),
    zoom: 15,
  );

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  void onTap(LatLng posicion) {
    final id = _markers.length.toString();
    final markerid = MarkerId(id);
    final marker = Marker(
        markerId: markerid,
        position: posicion,
        onTap: () {
          _markersController.sink.add(id);
        });
    _markers[markerid] = marker;
    notifyListeners();
  }

  @override
  void dispose() {
    _markersController.close();
    super.dispose();
  }
}
