import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  static ThemeData lightThemeData = ThemeData(
    appBarTheme: const AppBarTheme(
      elevation: 1,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.brown.shade500,
      secondary: Colors.brown.shade300,
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyMedium: GoogleFonts.robotoCondensed(
            color: Colors.black,
          ),
          titleLarge: GoogleFonts.robotoCondensed(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: GoogleFonts.robotoCondensed(
            color: Colors.black,
          ),
          titleSmall: GoogleFonts.robotoCondensed(
            color: Colors.black,
          ),
        ),
  );
}

class DarkTheme {
  static ThemeData darkThemeData = ThemeData(
    appBarTheme: const AppBarTheme(
      elevation: 1,
    ),
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
    ).copyWith(
      primary: Colors.brown.shade600,
      secondary: Colors.brown.shade300,
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyMedium: GoogleFonts.robotoCondensed(
            color: Colors.white,
          ),
          titleLarge: GoogleFonts.robotoCondensed(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: GoogleFonts.robotoCondensed(
            color: Colors.white,
          ),
          titleSmall: GoogleFonts.robotoCondensed(
            color: Colors.white,
          ),
        ),
  );
}
