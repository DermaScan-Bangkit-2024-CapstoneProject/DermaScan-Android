import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFCCD5AE);
  static const Color accentColor = Color(0xFFE5C8AB);
  static const Color secondaryColor = Color(0xFFFAEDCD);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: secondaryColor,
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.epilogue(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      bodyMedium: GoogleFonts.epilogue(
        textStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 14,
        ),
      ),
      displayLarge: GoogleFonts.epilogue(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: GoogleFonts.epilogue(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
  );
}
