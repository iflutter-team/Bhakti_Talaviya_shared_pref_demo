import 'package:flutter/material.dart';
import 'package:shared_pref_demo/screen/home/home_screen.dart';
import 'package:shared_pref_demo/screen/home/home_screen_api.dart';
import 'package:shared_pref_demo/screen/home/reg_api/reg_api_screen.dart';

class LoginApiscreen extends StatefulWidget {
  const LoginApiscreen({super.key});

  @override
  State<LoginApiscreen> createState() => _LoginApiscreenState();
}

class _LoginApiscreenState extends State<LoginApiscreen> {
  TextEditingController controllerIdLoginApi = TextEditingController();
  TextEditingController controllerNameLoginApi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login Screen",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
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
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controllerNameLoginApi,
              decoration: InputDecoration(
                hintText: 'Name',
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
