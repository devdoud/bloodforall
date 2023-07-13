import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:nb_utils/nb_utils.dart';

import '../utils/utils_functions.dart';

class RequestAssistant {
  static const String url = "https://blood4all-backend.vercel.app/api/";
  Future<dynamic> httpGetRequest(String path, String authorization) async {
    http.Response response = await http.get(Uri.parse(url + path), headers: {
      "Access-Control-Allow-Origin": "*",
      'Accept': '*/*',
      'Authorization': 'Bearer $authorization',
      // 'Content-Type': 'application/json; charset=UTF-8',
    });

    try {
      // if (response.statusCode == 200) {
      print(response.body);
      String jSonData = response.body;
      var decodeData = jsonDecode(jSonData);
      return decodeData;
      // } else {
      //   print("mon code decode n'est pas là");
      //   throw "Veuillez Reessayer";
      // }
    } catch (exp) {
      Get.back();
      UtilsFunction.showSnackBar(message: exp.toString());
    }
  }

  Future<dynamic> httpPostRequest(
      String path, String authorization, dynamic data,
      {bool jsonType = false}) async {
    http.Response response = await http.post(Uri.parse(url + path),
        headers: {
          'Accept': '*/*',
          'Authorization': 'Bearer $authorization',
          // if (jsonType)
          // 'Content-Type': 'application/json; charset=UTF-8',
        },
        body: data);
    print(response.body);
    try {
      print(response.statusCode);
      if (!await isNetworkAvailable()) throw "Oops pas d'internet";
      // if ([200, 201,400].contains(response.statusCode)) {
      String jSonData = response.body;
      var decodeData = jsonDecode(jSonData);
      return decodeData;
      // }
    } catch (exp) {
      Get.back();
      UtilsFunction.showSnackBar(message: exp.toString());
    }
  }

  Future<dynamic> httpPatchRequest(
      String path, String authorization, Map data) async {
    http.Response response = await http.patch(Uri.parse(url + path),
        headers: {
          'Accept': '*/*',
          'Authorization': 'Bearer $authorization',
          // 'Content-Type': 'application/json; charset=UTF-8',
        },
        body: data);
    print(response.body);
    try {
      print(response.statusCode);
      if (!await isNetworkAvailable()) throw "Oops pas d'internet";
      // if ([200, 201,400].contains(response.statusCode)) {
      String jSonData = response.body;
      var decodeData = jsonDecode(jSonData);
      return decodeData;
      // }
    } catch (exp) {
      Get.back();
      UtilsFunction.showSnackBar(message: exp.toString());
    }
  }
}
