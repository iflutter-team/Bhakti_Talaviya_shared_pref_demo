import 'package:flutter/foundation.dart';
import 'package:shared_pref_demo/model/reg_model.dart';
import 'package:shared_pref_demo/services/http_service.dart';
import 'package:shared_pref_demo/utils/endpoint_res.dart';
import 'package:http/http.dart' as http;

class RegApi {
  static Future regUser(Map<String, dynamic>? body) async {
    try {
      String url = EndPointRes.register;
      http.Response? response = await HttpService.postApi(
          url: url, body: body, header: {'Content-Type': 'application/json'});
      if (response != null && response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
          return registrationModelFromJson(response.body);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
        return null;
      }
    }
  }
}
