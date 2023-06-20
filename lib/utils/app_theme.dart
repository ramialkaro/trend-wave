import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData customTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
    unselectedItemColor: Colors.grey[300],
  ),
  primaryColor: Colors.blue,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: GoogleFonts.roboto(
      letterSpacing: 1.3,
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  ),
);
