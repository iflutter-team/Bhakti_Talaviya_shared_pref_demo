import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_pref_demo/services/firebase_services.dart';
import 'package:shared_pref_demo/utils/firebase_resource.dart';

import '../../model/models.dart';

Future<void> addData(
  String email,
  BuildContext context,
  Map<String, dynamic> user,
) async {
  List<User> userList = [];
  User userModel = User.fromJson(user);
  Map? allData =
      await FirebaseServices.getData(FirebaseResource.addUser, context);

  List<Map<String, dynamic>> userJsonList = [];
  if (allData != null) {
    // print(allData);

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
    // print(userList[0].email);
    bool val = userList.any((element) => element.email == email);
    // ignore: use_build_context_synchronously
    if (val) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Already Registerd'),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      bool isAddData = await FirebaseServices.addData(
          FirebaseResource.addUser, userModel.toJson(), context);
      if (isAddData) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signup Error, Please Check Again')));
      }
    }
  }

  // bool isAddData = await FirebaseServices.addData(
  //     FirebaseResource.addUser, userModel.toJson(), context);

  // userList = userFromJson(jsonEncode(userModel));
  // bool isRegister = userList.any((element) => element.email == email);

  // if (isAddData) {
  //   // ignore: use_build_context_synchronously
  //   Navigator.of(context).pop();
  // } else {
  //   // ignore: use_build_context_synchronously
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: Text('Sign UP Error! Please Check Again'),
  //     ),
  //   );
  // }
}
  
   

// User userData = User.fromJson(user);
  // String userString = PrefService.getString(PrefResources.isGetString);
  // List<User> userList = [];
  // if (userString != '') {
  //   userList = userFromJson(userString);
  //   userModel.id = userList.length;
  //   userList.add(userModel);
  // } else {
  //   userModel.id = 0;
  //   userList.add(userModel);
  // }
  // userString = userToJson(userList);
  // await PrefService.setValue(PrefResources.isGetString, userString);

