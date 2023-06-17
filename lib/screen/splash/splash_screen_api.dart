import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_pref_demo/screen/home/home_screen.dart';
import 'package:shared_pref_demo/screen/login_api/login_apis_screen.dart';
import 'package:shared_pref_demo/services/pref_service.dart';
import 'package:shared_pref_demo/utils/prefrence_res.dart';

class SplashscreenApi extends StatefulWidget {
  const SplashscreenApi({super.key});

  @override
  State<SplashscreenApi> createState() => _SplashscreenApiState();
}

class _SplashscreenApiState extends State<SplashscreenApi> {
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
            builder: (context) => isLogin ? HomeScreen() : LoginApiscreen(),
          ),
          (route) => false);
    });
    // PrefService.getBool(PrefRes
    // ources.isRegister);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Splash Screeen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
