import 'package:flutter/material.dart';
import 'package:shared_pref_demo/model/reg_model.dart';
import 'package:shared_pref_demo/screen/login_api/login_apis_screen.dart';
import 'package:shared_pref_demo/screen/reg_api/reg_api.dart';

class RegistrationApiScreen extends StatefulWidget {
  const RegistrationApiScreen({super.key});

  @override
  State<RegistrationApiScreen> createState() => _RegistrationApiScreenState();
}

class _RegistrationApiScreenState extends State<RegistrationApiScreen> {
  TextEditingController controllerEmailIdRegApi = TextEditingController();
  TextEditingController controllerfNameRegApi = TextEditingController();
  TextEditingController controllerlNameRegApi = TextEditingController();
  TextEditingController controllerPassRegApi = TextEditingController();
  RegistrationModel? regModel;

  Future userRegistration() async {
    Map<String, dynamic> body = {
      'FirstName': controllerfNameRegApi.text.trim(),
      'LastName': controllerlNameRegApi.text.trim(),
      'EmailId': controllerEmailIdRegApi.text.trim(),
      'Password': controllerPassRegApi.text.trim(),
    };
    regModel = await RegApi.regUser(body);
    if (regModel != null && regModel!.status == 1) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginApiscreen(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Already Registered')));
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
              "Register Screen",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controllerEmailIdRegApi,
              decoration: InputDecoration(
                hintText: 'EmailId',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controllerPassRegApi,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controllerfNameRegApi,
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
              controller: controllerlNameRegApi,
              decoration: InputDecoration(
                hintText: 'Last Name',
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
              onPressed: () {
                userRegistration();
              },
              child: const Text('Registration'),
            )
          ],
        ),
      ),
    );
  }
}
