import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_pref_demo/screen/home/login_api/login_apis_screen.dart';
import 'package:shared_pref_demo/services/pref_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await PrefService.init();
  runApp(const MaterialApp(
    home: LoginApiscreen(),
    debugShowCheckedModeBanner: false,
  ));
}
