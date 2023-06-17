import 'package:flutter/foundation.dart';
import 'package:shared_pref_demo/model/login_model.dart';

import 'package:shared_pref_demo/services/http_service.dart';
import 'package:shared_pref_demo/utils/endpoint_res.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future loginApi(Map<String, dynamic> body) async {
    try {
      String url = EndPointRes.login;
      http.Response? response = await HttpService.postApi(
          body: body, url: url, header: {'Content-Type': 'application/json'});
      if (response != null && response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
          return loginModelFromJson(response.body);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
