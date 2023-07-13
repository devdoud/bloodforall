import 'package:flutter/material.dart';

import 'constants.dart';

final ThemeData myTheme = ThemeData(
    primaryColor: primary,
    textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 24,
            color: secondary,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins'),
        titleMedium: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: othercolor)),
    fontFamily: 'Poppins');
