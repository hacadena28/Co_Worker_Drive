import 'package:coworkerdriver/domain/controller/controladorAuth.dart';
import 'package:coworkerdriver/domain/controller/controladoruser.dart';
import 'package:coworkerdriver/ui/pages/MyApp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(Controllerauthf());
  Get.put(ControllerUser());
  runApp(const MyApp());
}
