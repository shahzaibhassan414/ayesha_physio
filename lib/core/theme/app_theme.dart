import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primaryTeal,
      primary: AppColors.primaryTeal,
      secondary: AppColors.softAqua,
      tertiary: AppColors.deepNavy,
      surface: AppColors.pureWhite,
      onSurface: AppColors.darkText,
    );

    final textTheme = GoogleFonts.interTextTheme().copyWith(
      displayLarge: GoogleFonts.manrope(
        fontSize: 64,
        height: 1.08,
        letterSpacing: -2,
        fontWeight: FontWeight.w800,
        color: AppColors.primaryNavy,
      ),
      displayMedium: GoogleFonts.manrope(
        fontSize: 48,
        height: 1.12,
        letterSpacing: -1.4,
        fontWeight: FontWeight.w800,
        color: AppColors.primaryNavy,
      ),
      headlineLarge: GoogleFonts.manrope(
        fontSize: 40,
        height: 1.18,
        letterSpacing: -1,
        fontWeight: FontWeight.w800,
        color: AppColors.primaryNavy,
      ),
      headlineMedium: GoogleFonts.manrope(
        fontSize: 32,
        height: 1.22,
        letterSpacing: -.6,
        fontWeight: FontWeight.w800,
        color: AppColors.primaryNavy,
      ),
      titleLarge: GoogleFonts.manrope(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.darkText,
      ),
      titleMedium: GoogleFonts.manrope(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: AppColors.darkText,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 17,
        height: 1.65,
        fontWeight: FontWeight.w500,
        color: AppColors.mutedText,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 15,
        height: 1.55,
        fontWeight: FontWeight.w500,
        color: AppColors.mutedText,
      ),
      labelLarge: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.offWhite,
      textTheme: textTheme,
      focusColor: AppColors.primaryTeal.withValues(alpha: .18),
      dividerColor: AppColors.lightBorder,
      cardTheme: CardThemeData(
        color: AppColors.pureWhite,
        elevation: 0,
        shadowColor: AppColors.primaryNavy.withValues(alpha: .08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColors.lightBorder),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.pureWhite,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 17,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.lightBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.lightBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primaryTeal, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryTeal,
          foregroundColor: AppColors.pureWhite,
          minimumSize: const Size(48, 54),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: textTheme.labelLarge,
          elevation: 2,
          shadowColor: AppColors.primaryNavy.withValues(alpha: .18),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryTeal,
          minimumSize: const Size(48, 54),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          side: const BorderSide(color: AppColors.primaryTeal),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryTeal,
          textStyle: textTheme.labelLarge,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryTeal,
        foregroundColor: AppColors.pureWhite,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
    );
  }
}
