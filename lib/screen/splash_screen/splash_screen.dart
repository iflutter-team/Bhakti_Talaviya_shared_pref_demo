import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_pref_demo/screen/home/home_screen.dart';
import 'package:shared_pref_demo/screen/login/login_screen.dart';
import 'package:shared_pref_demo/services/pref_service.dart';
import 'package:shared_pref_demo/utils/prefrence_res.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TO
    //DO: implement initState
    super.initState();

    bool isLogin = PrefService.getBool(PrefResources.isRegister);

    Timer(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => isLogin ? HomeScreen() : LoginScreen(),
          ),
          (route) => false);
    });
    // PrefService.getBool(PrefRes
    // ources.isRegister);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash screen',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
