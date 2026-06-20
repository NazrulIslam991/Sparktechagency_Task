import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constant/color_manager.dart';
import '../constant/font_manager.dart';

class DarkTheme {
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: ColorManager.primaryDark,
    scaffoldBackgroundColor: ColorManager.scaffoldColorDark,
    cardColor: ColorManager.cardDark,

    ///************************  Color Scheme *************************
    colorScheme: ColorScheme.dark(
      primary: ColorManager.primaryDark, // Deep brand color for Dark Mode
      onPrimary: Colors.white,
      secondary: ColorManager.primaryLight, // Bright contrast color
      surface: ColorManager.surfaceDark, // Background for dialogs/cards
      onSurface: ColorManager.textLight, // Text color for Dark Mode
      error: Colors.redAccent,
      primaryContainer: ColorManager.c1A1627, // Dark container background
      onPrimaryContainer: ColorManager.textLight,
      outline: ColorManager.c2E2745, // Subtle borders for dark backgrounds
    ),

    ///*********************** cursor color ***************************
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorManager.white,
      selectionColor: ColorManager.white,
      selectionHandleColor: ColorManager.white,
    ),

    ///************************* AppBar Theme ********************************
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Brightness.light, // White icons for dark background
        statusBarBrightness: Brightness.dark,
      ),
      backgroundColor: ColorManager.primaryDark,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: ColorManager.textLight,
        fontSize: FontSize.s18,
        fontWeight: FontWeightManager.bold700,
      ),
    ),

    /// ************************ Text Theme **********************
    textTheme: TextTheme(
      /// --- DISPLAY ---
      displayLarge: TextStyle(
        fontSize: FontSize.s32,
        fontWeight: FontWeightManager.regular400,
        color: ColorManager.textLight,
      ),
      displayMedium: TextStyle(
        fontSize: FontSize.s28,
        fontWeight: FontWeightManager.regular400,
        color: ColorManager.textLight,
      ),
      displaySmall: TextStyle(
        fontSize: FontSize.s24,
        fontWeight: FontWeightManager.regular400,
        color: ColorManager.textLight,
      ),

      /// --- HEADLINE ---
      headlineLarge: TextStyle(
        fontSize: FontSize.s32,
        fontWeight: FontWeightManager.bold700,
        color: ColorManager.textLight,
      ),
      headlineMedium: TextStyle(
        fontSize: FontSize.s28,
        fontWeight: FontWeightManager.semiBold600,
        color: ColorManager.textLight,
      ),
      headlineSmall: TextStyle(
        fontSize: FontSize.s24,
        fontWeight: FontWeightManager.medium500,
        color: ColorManager.textLight,
      ),

      /// --- TITLE ---
      titleLarge: TextStyle(
        fontSize: FontSize.s22,
        fontWeight: FontWeightManager.bold700,
        color: ColorManager.textLight,
      ),
      titleMedium: TextStyle(
        fontSize: FontSize.s16,
        fontWeight: FontWeightManager.medium500,
        color: ColorManager.textLight,
      ),
      titleSmall: TextStyle(
        fontSize: FontSize.s14,
        fontWeight: FontWeightManager.medium500,
        color: ColorManager.textLight,
      ),

      /// --- BODY ---
      bodyLarge: TextStyle(
        fontSize: FontSize.s16,
        fontWeight: FontWeightManager.regular400,
        color: ColorManager.textLight,
      ),
      bodyMedium: TextStyle(
        fontSize: FontSize.s14,
        fontWeight: FontWeightManager.regular400,
        color: ColorManager.textLight,
      ),
      bodySmall: TextStyle(
        fontSize: FontSize.s12,
        fontWeight: FontWeightManager.regular400,
        color: ColorManager.greyLightText,
      ),

      /// --- LABEL ---
      labelLarge: TextStyle(
        fontSize: FontSize.s14,
        fontWeight: FontWeightManager.semiBold600,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontSize: FontSize.s12,
        fontWeight: FontWeightManager.medium500,
        color: ColorManager.textLight,
      ),
      labelSmall: TextStyle(
        fontSize: FontSize.s11,
        fontWeight: FontWeightManager.medium500,
        color: ColorManager.textLight,
      ),
    ),

    ///************************  Elevated btn styles **********************************
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.black2,
        foregroundColor: ColorManager.textLight,
        minimumSize: Size(double.infinity, 50),
        textStyle: TextStyle(
          fontSize: FontSize.s16,
          fontWeight: FontWeight.bold,
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: ColorManager.c2E2745, width: 1),
        ),
      ),
    ),

    ///************************   Outlined btn styles **********************************
    outlinedButtonTheme: OutlinedButtonThemeData(
      style:
          OutlinedButton.styleFrom(
            foregroundColor: ColorManager.textLight,
            minimumSize: Size(double.infinity, 50),
            side: BorderSide(color: ColorManager.c2E2745, width: 1),
            textStyle: TextStyle(
              fontSize: FontSize.s16,
              fontWeight: FontWeightManager.semiBold600,
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.transparent,
          ).copyWith(
            overlayColor: WidgetStateProperty.all(
              ColorManager.c2E2745.withAlpha(30),
            ),
          ),
    ),

    ///********************** Input Decoration Theme ******************************
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.black2,
     // contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),

      // Text Styles
      hintStyle: TextStyle(
        color: Colors.grey.shade600,
        fontSize: FontSize.s14,
        fontWeight: FontWeightManager.regular400,
      ),
      labelStyle: TextStyle(
        color: ColorManager.textLight,
        fontSize: FontSize.s14,
        fontWeight: FontWeightManager.medium500,
      ),
      errorStyle: TextStyle(color: Colors.redAccent, fontSize: FontSize.s12),

      // Borders
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: ColorManager.c2E2745, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: ColorManager.primaryLight, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.redAccent, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.redAccent, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: ColorManager.c2E2745.withAlpha(50)),
      ),
    ),

    ///**************************** bottom navigation bar theme ***********************************
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: ColorManager.primaryLight,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      type: BottomNavigationBarType.fixed,
    ),

    /// ************************* FAB ***********************************
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.primaryLight,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
