import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'utils/mapSatyle.dart';

class Mapa_controller {
  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }
}
