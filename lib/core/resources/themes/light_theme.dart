import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/color_manager.dart';
import '../constant/font_manager.dart';

class LightTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: ColorManager.primaryLight, // Main brand color for the app
    scaffoldBackgroundColor:
        ColorManager.scaffoldColorLight, // Default background for all screens
    cardColor: ColorManager.cardLight, // Background color for Card widgets
    dividerColor:
        ColorManager.cECEEF0, // Color for horizontal/vertical dividers
    ///*********************** cursor color ***************************
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorManager.primaryDark,
      selectionColor: ColorManager.primaryDark,
      selectionHandleColor: ColorManager.primaryDark,
    ),

    ///************************  Color Scheme *************************
    colorScheme: ColorScheme.light(
      primary: ColorManager.primaryLight, // Used for prominent UI elements
      onPrimary:
          Colors.white, // Color for text/icons sitting on top of primary color
      secondary:
          ColorManager.primaryDark, // Accent color for less prominent elements
      onSecondary:
          Colors.white, // Color for text/icons on top of secondary color
      surface:
          ColorManager.surfaceLight, // Color for surfaces like cards and sheets
      onSurface: ColorManager.textDark, // Color for text on surfaces
      error: Colors.redAccent, // Color used for error states and validation
      primaryContainer: ColorManager.cF6F8FA, // Background for large containers
      onPrimaryContainer:
          ColorManager.textDark, // Text color inside primary containers
      outline: ColorManager.cECEEF0, // Used for borders and decorative outlines
    ),

    ///************************* AppBar Theme ********************************
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor:
            Colors.transparent, // Makes status bar background invisible
        statusBarIconBrightness:
            Brightness.dark, // Dark icons for light background
        statusBarBrightness:
            Brightness.light, // iOS specific status bar setting
      ),
      backgroundColor: ColorManager.primaryLight,
      elevation: 0, // Flat design without shadows
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black, size: 24),
      titleTextStyle: TextStyle(
        color: ColorManager.textDark,
        fontSize: FontSize.s18, // Responsive font size
        fontWeight: FontWeightManager.bold700,
      ),
    ),

    /// ************************ Text Theme **********************
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: FontSize.s32,
        fontWeight: FontWeightManager.regular400,
        color: ColorManager.textDark,
      ),
      displayMedium: TextStyle(
        fontSize: FontSize.s28,
        fontWeight: FontWeightManager.regular400,
        color: ColorManager.textDark,
      ),
      displaySmall: TextStyle(
        fontSize: FontSize.s24,
        fontWeight: FontWeightManager.regular400,
        color: ColorManager.textDark,
      ),

      /// --- HEADLINE: For main page headers ---
      headlineLarge: TextStyle(
        fontSize: FontSize.s32,
        fontWeight: FontWeightManager.bold700,
        color: ColorManager.textDark,
      ),
      headlineMedium: TextStyle(
        fontSize: FontSize.s28,
        fontWeight: FontWeightManager.semiBold600,
        color: ColorManager.textDark,
      ),
      headlineSmall: TextStyle(
        fontSize: FontSize.s24,
        fontWeight: FontWeightManager.medium500,
        color: ColorManager.textDark,
      ),

      /// --- TITLE: For sub-headings or list item titles ---
      titleLarge: TextStyle(
        fontSize: FontSize.s22,
        fontWeight: FontWeightManager.bold700,
        color: ColorManager.textDark,
      ),
      titleMedium: TextStyle(
        fontSize: FontSize.s16,
        fontWeight: FontWeightManager.medium500,
        color: ColorManager.textDark,
      ),
      titleSmall: TextStyle(
        fontSize: FontSize.s14,
        fontWeight: FontWeightManager.medium500,
        color: ColorManager.textDark,
      ),

      /// --- BODY: For main content, descriptions, and paragraph text ---
      bodyLarge: TextStyle(
        fontSize: FontSize.s16,
        fontWeight: FontWeightManager.regular400,
        color: ColorManager.textDark,
      ),
      bodyMedium: TextStyle(
        fontSize: FontSize.s14,
        fontWeight: FontWeightManager.regular400,
        color: ColorManager.textDark,
      ),
      bodySmall: TextStyle(
        fontSize: FontSize.s12,
        fontWeight: FontWeightManager.regular400,
        color: ColorManager.greyLightText,
      ),

      /// --- LABEL: For buttons, captions, and tiny UI tags ---
      labelLarge: TextStyle(
        fontSize: FontSize.s14,
        fontWeight: FontWeightManager.semiBold600,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontSize: FontSize.s12,
        fontWeight: FontWeightManager.medium500,
        color: ColorManager.textDark,
      ),
      labelSmall: TextStyle(
        fontSize: FontSize.s11,
        fontWeight: FontWeightManager.medium500,
        color: ColorManager.textDark,
      ),
    ),

    ///************************  Elevated btn styles **********************************
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.cF6F8FA,
        foregroundColor: ColorManager.textDark,
        minimumSize: Size(double.infinity, 50),
        textStyle: TextStyle(
          fontSize: FontSize.s16,
          fontWeight: FontWeight.bold,
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    ),

    ///************************   Outlined btn styles **********************************
    outlinedButtonTheme: OutlinedButtonThemeData(
      style:
          OutlinedButton.styleFrom(
            foregroundColor: ColorManager.textDark,
            minimumSize: Size(double.infinity, 50),
            side: BorderSide(color: ColorManager.lightGray, width: 1),
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
      fillColor: ColorManager.cF6F8FA,
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),

      // Icon Colors
      prefixIconColor: ColorManager.primaryLight,
      suffixIconColor: ColorManager.primaryLight,

      // Text Styles
      hintStyle: TextStyle(
        color: Colors.grey.shade500,
        fontSize: FontSize.s14,
        fontWeight: FontWeightManager.regular400,
      ),
      labelStyle: TextStyle(
        color: ColorManager.textDark,
        fontSize: FontSize.s14,
        fontWeight: FontWeightManager.medium500,
      ),
      errorStyle: TextStyle(color: Colors.redAccent, fontSize: FontSize.s12),

      // Borders
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: ColorManager.cECEEF0, width: 1),
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
        borderSide: BorderSide(color: Colors.grey.shade300),
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
