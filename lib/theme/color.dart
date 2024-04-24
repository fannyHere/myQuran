import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const appPurple = Color(0xFF431AA1);
const appPurpleDark = Color(0xFF1E0771);
const appPurpleLight1 = Color(0xFF9345F2);
const appPurpleLight2 = Color(0xFFB9A2DB);
const appWhite = Color(0xFFFAF8FC);
const appOrange = Color(0xFFE6704A);

//VERSI TEMA CERAH
// ThemeData appLight = ThemeData(
//   primaryColor: appPurple,
//   appBarTheme: AppBarTheme(
//     backgroundColor: appPurple,
//   ),
//   fontFamily: GoogleFonts.dosis().fontFamily,
// );

//VERSI TEMA GELAP
// ThemeData appDark = ThemeData(
//   primaryColor: appPurpleLight2,
//   scaffoldBackgroundColor: appPurpleDark,
//   appBarTheme: AppBarTheme(
//     backgroundColor: appPurpleDark,
//   ),
//   textTheme: TextTheme(
//     bodyLarge: TextStyle(color: appOrange),
//     bodyMedium: TextStyle(color: appWhite),
//   ),
//   fontFamily: GoogleFonts.dosis().fontFamily,
// );

class MyThemes1 {
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      primaryColor: appPurple,
      scaffoldBackgroundColor: appPurpleDark,
      appBarTheme: AppBarTheme(
        backgroundColor: appPurple,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            color: appOrange, fontFamily: GoogleFonts.dosis().fontFamily),
        bodyMedium: TextStyle(
            color: appWhite, fontFamily: GoogleFonts.dosis().fontFamily),
      ),
    );
  }
}

class MyThemes2 {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: appPurpleLight2,
      scaffoldBackgroundColor: appPurpleDark,
      appBarTheme: AppBarTheme(
        backgroundColor: appPurpleDark,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            color: appOrange, fontFamily: GoogleFonts.dosis().fontFamily),
        bodyMedium: TextStyle(
            color: appWhite, fontFamily: GoogleFonts.dosis().fontFamily),
      ),
    );
  }
}
