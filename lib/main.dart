import 'dart:io';

import 'package:bloodforall/screens/alternativescreen/alternative_screen.dart';
import 'package:bloodforall/screens/qrcodescreen/qrcode_screen.dart';
import 'package:bloodforall/screens/reservationscreen/reserve_screen.dart';
import 'package:bloodforall/screens/resultscreen/result_screen.dart';
import 'package:bloodforall/screens/searchscreen/search_screen.dart';
import 'package:bloodforall/screens/splashscreen/splash_screen.dart';
import 'package:bloodforall/utils/loading_widget.dart';
import 'package:bloodforall/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: myTheme,
        home: QrcodeScreen(
          data: ['Patric', 'tete@gmail.com', '66000102'],
        ));
  }
}
