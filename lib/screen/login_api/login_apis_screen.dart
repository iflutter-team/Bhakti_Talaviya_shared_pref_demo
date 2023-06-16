import 'package:flutter/material.dart';
import 'package:shared_pref_demo/screen/home/home_screen.dart';
import 'package:shared_pref_demo/screen/reg_api/reg_api_screen.dart';

class LoginApiscreen extends StatefulWidget {
  const LoginApiscreen({super.key});

  @override
  State<LoginApiscreen> createState() => _LoginApiscreenState();
}

TextEditingController controllerIdLoginApi = TextEditingController();
TextEditingController controllerPassLoginApi = TextEditingController();
TextEditingController controllerLNameLoginApi = TextEditingController();
TextEditingController controllerFNameLoginApi = TextEditingController();

class _LoginApiscreenState extends State<LoginApiscreen> {
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
              controller: controllerLNameLoginApi,
              decoration: InputDecoration(
                hintText: 'Last Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controllerFNameLoginApi,
              decoration: InputDecoration(
                hintText: 'First Name',
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
