import 'dart:io';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

String apiUrl =
    !Platform.isAndroid ? 'http://127.0.0.1:3333' : 'http://10.0.2.2:3333';

ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: GoogleFonts.poppins(color: Colors.black),
      centerTitle: false,
    ),
    primaryColor: const Color(0xff6750A4));

ThemeData darkTheme = ThemeData(scaffoldBackgroundColor: Colors.black26);
