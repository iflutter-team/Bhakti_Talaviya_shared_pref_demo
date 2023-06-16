import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_pref_demo/services/internet_connection.dart';

class FirebaseServices {
  static FirebaseDatabase database = FirebaseDatabase.instance;

  static Future<bool> addData(
      String add, dynamic value, BuildContext context) async {
    bool isAddData = false;
    bool connection = await InternetConnection.internetConnectionChecker();
    if (connection) {
      try {
        String? key = database.ref(add).push().key;
        add = "${add}/${key}";
        DatabaseReference reference = database.ref(add);

        await reference.set(value).then(
          (value) {
            isAddData = true;
          },
        );

        // if (!isAddData) {
        //   // ignore: use_build_context_synchronously
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(
        //       content: Text('Already Register'),
        //     ),
        //   );
        // }
      } on PlatformException {
        isAddData = false;
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Signup Error'),
          ),
        );
        isAddData = false;
      }
      // } catch (e) {
      //   // ignore: use_build_context_synchronously
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(
      //       content: Text('Signup Error'),
      //     ),
      //   );
      //   isAddData = false;
      // }
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Plesae Check your Conncetion'),
        ),
      );
    }
    // if (isAddData = false) {
    //   // ignore: use_build_context_synchronously
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Already Register'),
    //     ),
    //   );
    // }
    return isAddData;
  }

  //data get karva mate

  static Future<Map?> getData(String key, BuildContext context) async {
    Map? allData;
    bool connection = await InternetConnection.internetConnectionChecker();
    if (connection) {
      try {
        DatabaseReference reference = database.ref(key);
        //valuye get karva mate
        await reference.get().then((value) {
          allData = value.value as Map;
        });
      } on PlatformException {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Signup Error'),
          ),
        );
      } catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data Error$e'),
          ),
        );
      }
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Plesae Check your Conncetion'),
        ),
      );
    }
    return allData;
  }
}
