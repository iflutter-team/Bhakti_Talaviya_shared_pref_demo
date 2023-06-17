import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_pref_demo/services/pref_service.dart';

import 'screen/splash/splash_screen_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await PrefService.init();
  runApp(const MaterialApp(
    home: SplashscreenApi(),
    debugShowCheckedModeBanner: false,
  ));
}
