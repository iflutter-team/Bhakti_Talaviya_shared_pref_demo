import 'package:flutter/material.dart';
import 'package:shared_pref_demo/screen/login_api/login_apis_screen.dart';

class RegistrationApiScreen extends StatefulWidget {
  const RegistrationApiScreen({super.key});

  @override
  State<RegistrationApiScreen> createState() => _RegistrationApiScreenState();
}

class _RegistrationApiScreenState extends State<RegistrationApiScreen> {
  TextEditingController controllerIdRegApi = TextEditingController();
  TextEditingController controllerNameRegApi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Register Screen",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controllerIdRegApi,
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
              controller: controllerNameRegApi,
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
                          builder: (context) => const LoginApiscreen(),
                        ));
                  },
                  child: const Text('Login'),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Registration'),
            )
          ],
        ),
      ),
    );
  }
}
