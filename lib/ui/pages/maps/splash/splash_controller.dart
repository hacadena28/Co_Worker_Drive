import 'package:coworkerdriver/ui/pages/MyApp.dart';
import 'package:coworkerdriver/ui/pages/maps/splash/routes.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends ChangeNotifier {
  final Permission _locationPermission;
  String? _routeName;
  String? get routeName => _routeName;

  SplashController(this._locationPermission);

  Future<void> checkPermission() async {
    final isGranted = await _locationPermission.isGranted;
     if (_routeName == isGranted) {
       Get.offAllNamed('/HomeMApsPasajero');
     } else {
     Get.offAllNamed('/RequestPermissionPage');
    }
     

    notifyListeners();
  }
}
