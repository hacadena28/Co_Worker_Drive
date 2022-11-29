
import 'package:coworkerdriver/ui/pages/maps/homeMapsPasajero.dart';
import 'package:coworkerdriver/ui/pages/maps/request_permission/request_permission.dart';
import 'package:coworkerdriver/ui/pages/maps/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

Map <String,Widget Function(BuildContext)>appRoutes(){
  return{

Routes.SplashPage:(_)=> SplashPage(),
Routes.RequestPermissionPage:(_)=> RequestPermissionPage(),
Routes.HomeMApsPasajero:(_)=> HomeMApsPasajero(), };
}