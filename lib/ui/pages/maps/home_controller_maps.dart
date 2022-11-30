import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../mapaPasajero/homeMapsPasajero.dart';
import '../mapaPasajero/utils/mapSatyle.dart';

class Mapa_controller extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();
  Map<MarkerId, Marker> _marcadores = <MarkerId, Marker>{};
  MarkerId? _marcadorSeleccionado;
  int _contadorIdMarcador = 1;
  LatLng? _posicionMarcador;
  String pais = '';
  String ciudad = '';
  String direccion = '';
  var direccionfinal = ''.obs;

  String get obtenerDireccionFinal => direccionfinal.value;

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

  void onTap(LatLng posicion) async {
    direccionfinal = direccionfinal;
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

    List<Placemark> placemarks =
        await placemarkFromCoordinates(posicion.latitude, posicion.longitude);

    pais = placemarks.reversed.last.country.toString();
    ciudad = placemarks.reversed.last.locality.toString();
    direccion = placemarks.reversed.last.street.toString();
    direccionfinal.value = '$pais $ciudad $direccion';

    print('------------%%%%%%%%%%%------------->$pais $ciudad $direccion');
    asignarDireccion('$pais $ciudad $direccion');


    //probando();
  

  }

  @override
  void dispose() {
    _markersController.close();
    super.dispose();
  }

  String probando() {
    print('entro al metodo probrar $pais');
    return ('$pais');
  }

  asignarDireccion(var a) {
    print('===============================');

    print(a);
    direccionfinal.value = a;
  }
}
