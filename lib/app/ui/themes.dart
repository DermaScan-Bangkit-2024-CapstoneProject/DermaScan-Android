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
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        textStyle: GoogleFonts.epilogue(
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      labelStyle: GoogleFonts.epilogue(
        textStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 14,
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
  );
}
