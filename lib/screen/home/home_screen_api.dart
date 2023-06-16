import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_pref_demo/model/photosModel.dart';
import 'package:shared_pref_demo/model/product_model.dart';
import 'package:shared_pref_demo/services/http_service.dart';
import 'package:shared_pref_demo/utils/endpoint_res.dart';

class HomeScreenApi {
  //GetApi
  static Future getData() async {
    try {
      http.Response? response =
          await HttpService.getApi(url: EndPointRes.productAPI);
      if (response != null && response.statusCode == 200) {
        return productModelFromJson(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
        return null;
      }
    }
  }

  //PostApi
  // static Future addData(Map<String, dynamic> body) async {
  //   try {
  //     http.Response? response = await HttpService.postApi(
  //       url: EndPointRes.photosEndPoint,
  //       body:
  //     );
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  // }
}
