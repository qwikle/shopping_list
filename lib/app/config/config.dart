import 'dart:io';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

String apiUrl =
    !Platform.isAndroid ? 'http://127.0.0.1:3333' : 'http://10.0.2.2:3333';

const Color primaryColor = Color(0xff6750A4);
BorderRadius borderRadius = BorderRadius.circular(30.h);

ThemeData theme = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    titleTextStyle: GoogleFonts.poppins(color: Colors.black),
    centerTitle: false,
  ),
  primaryColor: primaryColor,
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: const TextStyle(color: primaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: primaryColor),
      borderRadius: borderRadius,
    ),
    border: OutlineInputBorder(
      borderRadius: borderRadius,
    ),
  ),
);

ThemeData darkTheme = ThemeData(scaffoldBackgroundColor: Colors.black26);
