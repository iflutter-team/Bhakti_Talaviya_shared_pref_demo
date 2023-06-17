import 'package:flutter/material.dart';
import 'package:shared_pref_demo/model/login_model.dart';
import 'package:shared_pref_demo/screen/home/home_screen.dart';
import 'package:shared_pref_demo/screen/login_api/login_api.dart';
import 'package:shared_pref_demo/screen/reg_api/reg_api_screen.dart';
import 'package:shared_pref_demo/services/pref_service.dart';
import 'package:shared_pref_demo/utils/prefrence_res.dart';

class LoginApiscreen extends StatefulWidget {
  const LoginApiscreen({super.key});

  @override
  State<LoginApiscreen> createState() => _LoginApiscreenState();
}

class _LoginApiscreenState extends State<LoginApiscreen> {
  TextEditingController controllerIdLoginApi = TextEditingController();
  TextEditingController controllerPassLoginApi = TextEditingController();
  LoginModel? loginModel;
  // LoginModel? loginModel;
  Future loginAuth() async {
    Map<String, dynamic> body = {
      'email': controllerIdLoginApi.text.trim(),
      'Password': controllerPassLoginApi.text.trim()
    };

    loginModel = await LoginApi.loginApi(body);
    if (loginModel != null && loginModel!.status == 1) {
      PrefService.setValue(PrefResources.isRegister, true);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Login Screen",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controllerIdLoginApi,
              decoration: InputDecoration(
                hintText: 'Id',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controllerPassLoginApi,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already User?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrationApiScreen(),
                        ));
                  },
                  child: const Text('Regiser'),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                loginAuth();
              },
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
