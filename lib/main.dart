import 'dart:io';

import 'package:bloodforall/screens/searchscreen/search_screen.dart';
import 'package:bloodforall/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controllers/bank_controller.dart';
import 'Controllers/doctor_controller.dart';
import 'Controllers/user_controller.dart';

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

DoctorController doctorController = DoctorController();
UserController userController = UserController();
BankController bankController = BankController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: myTheme,
        home: const SearchScreen()
        // QrcodeScreen(
        //   data: ['Patric', 'tete@gmail.com', '66000102'],
        // )
        );
  }
}
