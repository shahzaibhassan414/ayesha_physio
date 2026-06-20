import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.forest,
      primary: AppColors.forest,
      secondary: AppColors.coral,
      surface: AppColors.white,
    );

    final textTheme = GoogleFonts.dmSansTextTheme().copyWith(
      displayLarge: GoogleFonts.playfairDisplay(
        fontSize: 64,
        height: 1.05,
        fontWeight: FontWeight.w700,
        color: AppColors.ink,
      ),
      displayMedium: GoogleFonts.playfairDisplay(
        fontSize: 48,
        height: 1.1,
        fontWeight: FontWeight.w700,
        color: AppColors.ink,
      ),
      headlineLarge: GoogleFonts.playfairDisplay(
        fontSize: 40,
        height: 1.15,
        fontWeight: FontWeight.w700,
        color: AppColors.ink,
      ),
      headlineMedium: GoogleFonts.playfairDisplay(
        fontSize: 32,
        height: 1.2,
        fontWeight: FontWeight.w700,
        color: AppColors.ink,
      ),
      titleLarge: GoogleFonts.dmSans(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.ink,
      ),
      titleMedium: GoogleFonts.dmSans(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: AppColors.ink,
      ),
      bodyLarge: GoogleFonts.dmSans(
        fontSize: 17,
        height: 1.65,
        color: AppColors.muted,
      ),
      bodyMedium: GoogleFonts.dmSans(
        fontSize: 15,
        height: 1.55,
        color: AppColors.muted,
      ),
      labelLarge: GoogleFonts.dmSans(fontSize: 15, fontWeight: FontWeight.w700),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.cream,
      textTheme: textTheme,
      focusColor: AppColors.coral.withValues(alpha: .22),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 17,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.forest, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.forest,
          foregroundColor: AppColors.white,
          minimumSize: const Size(48, 54),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: textTheme.labelLarge,
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.forest,
          minimumSize: const Size(48, 54),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          side: const BorderSide(color: AppColors.forest),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
    );
  }
}
