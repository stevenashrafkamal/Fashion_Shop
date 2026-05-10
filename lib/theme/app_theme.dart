import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFF4A69FE);
  static ThemeData lightTheme() {
    final base = ThemeData.light();
    return base.copyWith(
      primaryColor: primary,
      appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0, backgroundColor: Colors.white, foregroundColor: Colors.black),
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme),
      scaffoldBackgroundColor: const Color(0xFFF6F7FB),
    );
  }
}