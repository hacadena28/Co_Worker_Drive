import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../mapaPasajero/utils/mapSatyle.dart';

class Mapa_controller extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();
  Map<MarkerId, Marker> _marcadores = <MarkerId, Marker>{};
  MarkerId? _marcadorSeleccionado;
  int _contadorIdMarcador = 1;
  LatLng? _posicionMarcador;

  final _markersController = StreamController<String>.broadcast();
  Stream<String> get onMarkerTap => _markersController.stream;

  @override
  void initState() {}

  final initialCameraPosition = CameraPosition(
    target: LatLng(10.450254, -73.260486),
    zoom: 15,
  );

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  void onTap(LatLng posicion) {
    /* final id = _markers.length.toString();
    final markerid = MarkerId(id);
    final marker = Marker(
        markerId: markerid,
        position: posicion,
        onTap: () {
          _markersController.sink.add(id);
        });
    _markers[markerid] = marker;
    notifyListeners(); */
    if (_contadorIdMarcador <= 1) {
      if (_marcadores.length == 1) return;

      final id = _markers.length.toString();
      final markerid = MarkerId(id);
      final String cadenaIdMarcador;
      cadenaIdMarcador = 'Ubicación Destino';
      final MarkerId idMarcador = MarkerId(cadenaIdMarcador);
      LatLng coordenada;

      final Marker marcador = Marker(
        markerId: idMarcador,
        position: posicion,
        infoWindow: InfoWindow(title: cadenaIdMarcador, snippet: ''),
        onTap: () {
          // _markersController.sink.add(id);
        },
      );
      print('--------------------------------------->$marcador');

      _markers[markerid] = marcador;
      notifyListeners();
    } else {
      print('marcador menos a 1');
    }
  }

  @override
  void dispose() {
    _markersController.close();
    super.dispose();
  }
}
