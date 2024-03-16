import 'package:flutter/material.dart';
import 'package:plogathon/pages/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final colorScheme = const ColorScheme(
    primary: Color(0xFFBFECC6),
    onPrimary: Color(0xFF202020),
    secondary: Color(0xFF101C17),
    onSecondary: Color(0xFFFCFCFC),
    tertiary: Color(0xFF67B274),
    primaryContainer: Color(0xFFBFECC6),
    secondaryContainer: Color(0xFFF7FFD6),
    tertiaryContainer: Color(0xFFEDFAFF),
    background: Color(0xFF101C17),
    onBackground: Color(0xFFFFFFFF),
    surface: Color(0xFFF5F8EF),
    onSurface: Color(0xFF202020),
    error: Colors.red,
    onError: Colors.red,
    brightness: Brightness.light,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: colorScheme,
          textTheme: TextTheme(
            displayLarge: GoogleFonts.zenTokyoZoo(
                fontSize: MediaQuery.of(context).size.width < 385 ? 40 : 36,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFEDFB92)),
            bodyLarge: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF202020)),
            bodyMedium: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF202020)),
            bodySmall: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF202020)),
            titleLarge: GoogleFonts.poppins(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF67B274)),
            titleMedium: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF67B274)),
            titleSmall: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFEEEEEE)),
            labelLarge: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF202020)),
            labelMedium: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF747474)),
            labelSmall: GoogleFonts.poppins(
                fontSize: 8, fontWeight: FontWeight.w400, color: Colors.white),
          )),
      home: const OnboardingPage(),
    );
  }
}

class Environment {
  // ignore: constant_identifier_names
  static const MAPS_API_KEY = String.fromEnvironment('MAPS_API_KEY');
}
