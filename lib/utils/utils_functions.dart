
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UtilsFunction {
  UtilsFunction._();

  static debugPrintCustom(dynamic value) => debugPrint(value.toString());

  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }

  static void showNoInternetSnackBar() {
    showSnackBar(message: "No Internet stable");
  }

  static catchErrorApiCall() {
    if (e.toString() == "Failed host lookup: 'blood4all-backend.vercel.app'") {
      Get.back();
      UtilsFunction.showNoInternetSnackBar();
    } else {
      Get.back();
      UtilsFunction.showSnackBar(message: e.toString());
    }
  }

  static showSnackBar({String? title, String? message}) {
    Get.snackbar(title ?? '', message ?? '',
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.TOP,
        borderColor: Colors.black,
        borderWidth: 1,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(seconds: 1),
        titleText: title != null
            ? Text(title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w900))
            : Container(),
        messageText: message != null
            ? Text(message,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700))
            : Container());
  }

}
