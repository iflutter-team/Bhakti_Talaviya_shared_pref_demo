import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_pref_demo/model/models.dart';
import 'package:shared_pref_demo/screen/home/home_screen.dart';
import 'package:shared_pref_demo/services/firebase_services.dart';
import 'package:shared_pref_demo/utils/firebase_resource.dart';

Future<void> checkData(
  BuildContext context,
  String email,
  String pass,
) async {
  Map? allData =
      await FirebaseServices.getData(FirebaseResource.addUser, context);

  List<User> userList = [];
  List<Map<String, dynamic>> userJsonList = [];
  if (allData != null) {
    print(allData);

    allData.forEach(
      (key, value) {
        // value['id'] = key;

        Map<String, dynamic> userData = {};
        value['id'] = key;
        value.forEach(
          (key1, value) {
            userData[key1.toString()] = value;
          },
        );
        // print(value);
        userJsonList.add(userData);
      },
    );

    userList = userFromJson(jsonEncode(userJsonList));
    print(userList[0].email);
    bool val = userList
        .any((element) => element.email == email && element.password == pass);
    // ignore: use_build_context_synchronously
    if (val) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter Valid USer'),
        ),
      );
    }
  }
}
//   String userString = PrefService.getString(PrefResources.isGetString);
//   print(userString);
//   if (userString != '') {
//     List<User> userList = userFromJson(userString);
//     bool val = userList
//         .any((element) => element.email == email && element.password == pass);
//     if (val) {
//       //single user mate
//       int index = userList.indexWhere(
//           (element) => element.email == email && element.password == pass);

//       User loginUser = userList[index];
//       PrefService.setValue(
//         PrefResources.loginUser,
//         json.encode(
//           loginUser.toJson(),
//         ),
//       );
//       //aek var login thy gya pachi aene direct homa ma java dey shred preference mate chhe
//       PrefService.setValue(PrefResources.isRegister, true);
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const HomeScreen(),
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Enter valid User'),
//         ),
//       );
//     }
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Please register'),
//       ),
//     );
//   }
// }

