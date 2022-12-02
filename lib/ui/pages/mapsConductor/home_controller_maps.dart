import 'dart:async';

import 'package:coworkerdriver/ui/pages/pasajero/homePasajero.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../mapaPasajero/homeMapsPasajero.dart';
import '../mapaPasajero/utils/mapSatyle.dart';

class Mapa_controller extends ChangeNotifier {
  String pais2 = '';
  String ciudad2 = '';
  String direccion2 = '';
  Mapa_controller() {
    initState();
  }
  @override
  Future<void> initState() async {
    posicionInicial();
  }

  final Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();
  final _markersController = StreamController<String>.broadcast();
  final _markersController2 = StreamController<String>.broadcast();
  Stream<String> get onMarkerTap => _markersController.stream;
  Stream<String> get onMarkerTap2 => _markersController2.stream;

  Map<MarkerId, Marker> _marcadores = <MarkerId, Marker>{};
  HomeMApsPasajero mapaPasajero = new HomeMApsPasajero();
  int _contadorIdMarcador = 1;
  String pais = '';
  String ciudad = '';
  String direccion = '';

  final initialCameraPosition = CameraPosition(
    target: LatLng(10.450254, -73.260486),
    zoom: 15,
  );

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  void onTap(LatLng posicion) async {
    if (_contadorIdMarcador <= 1) {
      if (_marcadores.length == 1) return;

      final id = _markers.length.toString();
      final markerid = MarkerId(id);
      final String cadenaIdMarcador;
      cadenaIdMarcador = 'Ubicación Destino';
      final MarkerId idMarcador = MarkerId(cadenaIdMarcador);

      final Marker marcador = Marker(
          markerId: idMarcador,
          position: posicion,
          onTap: () {
            _markersController.sink.add(probando());
            _markersController2.sink.add(probando2());
          },
          infoWindow: InfoWindow(
            title: cadenaIdMarcador,
            snippet: '',
          ));
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

    print('---%%%%%%%%%%%------->$pais $ciudad $direccion');
    // asignarDireccion('$pais $ciudad $direccion');

    probando();
    posicionInicial();
  }

  @override
  void dispose() {
    _markersController.close();
    super.dispose();
  }

  String probando() {
    print('entro al metodo probrar $pais');
    return (' $ciudad $direccion');
  }

  String probando2() {
    print('entro al metodo probrar $pais2');
    return (' $ciudad2 $direccion2');
  }

  posicionInicial() async {
    final inicialPosicion = await Geolocator.getCurrentPosition();
    print("posicion inicial------------------ ");
    List<Placemark> posicionInicial = await placemarkFromCoordinates(
        inicialPosicion.latitude, inicialPosicion.longitude);

    pais2 = posicionInicial.reversed.last.country.toString();
    ciudad2 = posicionInicial.reversed.last.locality.toString();
    direccion2 = posicionInicial.reversed.last.street.toString();

    print('---=======================------->$pais2 $ciudad2 $direccion2');
    print(inicialPosicion);
  }
}
