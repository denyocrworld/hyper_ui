import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

ThemeData getDarkTheme() {
  return ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      elevation: 0.6,
      titleTextStyle: GoogleFonts.lato(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
    ),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.white,
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.lato(
        color: Colors.white,
      ),
      titleMedium: GoogleFonts.lato(
        color: Colors.white,
      ),
      titleLarge: GoogleFonts.lato(
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.lato(
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.lato(
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.lato(
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.blue),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    ),
  );
}
