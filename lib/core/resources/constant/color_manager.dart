import 'package:flutter/material.dart';

/// Centralized color palette for the app.
/// Defines both light and dark theme colors.
class ColorManager {
  ColorManager._();

  // ===== Primary Colors =====
  static const Color primary = Color(0xFF00136B);
  static const Color primaryLight = Color(0xFFFFFFFF);
  static const Color primaryDark = Color(0xFF000000);

  // ===== Text Colors =====
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color titleText = Color(0xFF2F3131);
  static const Color titleText1 = Color(0xFF535353);
  static const Color subtitleText = Color(0xFF686868);
  static const Color subtitleText1 = Color(0xFF60655C);
  static const Color mediumText = Color(0xFF363A33);

  // ===== Neutral Colors =====
  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color transparentColor = Colors.transparent;

  // ===== Border Colors =====
  static const Color borderColor = Color(0xFFDADADA);
  static const Color borderColor1 = Color(0xFF00136B);

  // ===== Feedback Colors =====
  static const Color errorColor = Color(0xFFE25839);

  //========================== new ==========================

  static const Color white = Color(0xFFFFFFFF);
  static const Color purpleShade = Color(0xff795FF4);
  static const Color purpleShade1 = Color(0xff8F6CFD);
  static const Color purpleShade2 = Color(0xff8E5EF3);
  static const Color purpleShade3 = Color(0xffEDE9FF);
  static const Color black700 = Color(0xff070707);
  static const Color black100 = Color(0xffD2D2D5);
  static const Color black300 = Color(0xff777980);
  static const Color normal25 = Color(0xffF6F8FA);
  static const Color normal200 = Color(0xffEAECF0);
  static const Color black200 = Color(0xffA5A5AB);
  static const Color red = Color(0xffEB3D4D);
  static const Color black50 = Color(0xffE9E9EA);
  static const Color gray = Color(0xffF6F8FA);
  static const Color black2 = Color(0x05000000);
  static const Color black4 = Color(0x0A000000);
  static const Color black6 = Color(0x0F000000);
  static const Color black400 = Color(0xff4A4C56);
  static const Color lightGray = Color(0xffD9D9D9);
  static const Color black500 = Color(0xff1D1F2C);
  static const Color additional = Color(0xffE3E7EC);
  static const Color blackSeco = Color(0xff797979);
  static const Color grayscale = Color(0xff66707A);
  static const Color border = Color(0xffE6E0FF);

  static const Color scaffoldColorLight = Color(0xFFFFFFFF);
  static const Color scaffoldColorDark = Color(0xFF000000);

  static const Color textDark = Color(0xFF000000);
  static const Color textLight = Color(0xFFFFFFFF);

  static const Color surfaceLight = Color(0xffF6F8FA);
  static const Color surfaceDark = Color(0xFF2E2745);

  static const Color cardDark = Color(0xFF1A1627);
  static const Color cardLight = Color(0xFFFFFFFF);

  static const Color greyLightText = Color(0xffA5A5AB);
  static const Color greyDarkText = Color(0xffD1D1D6);

  static const Color grey300 = Color(0xFF707076);
  static const Color green700 = Color(0xFF116557);
  static const Color green100 = Color(0xFFD3F4EF);

  static const Color cF1F3F5 = Color(0xFFF1F3F5);
  static const Color c1A1627 = Color(0xFF1A1627);
  static const Color cF6F8FA = Color(0xFFF6F8FA);
  static const Color c221E2F = Color(0xFF221E2F);
  static const Color cECEEF0 = Color(0xFFECEEF0);
  static const Color c2E2745 = Color(0xFF2E2745);
  static const Color c8E6AFB = Color(0xFF8E6AFB);
  static const Color c8969FB = Color(0xFF8969FB);

  static const Color aliceBlue = Color(0xFFF6F8FA);
  static const Color deepPurpleBg = Color(0xFF2E2745);
  static const Color aliceBlueVariant = Color(0xFFF4F7F7);
  static const Color mintMist = Color(0xFFD3F4EF);
  static const Color mintAqua = Color(0xFFD3F4EF);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF795FF4),
      Color(0xFF8F6CFD),
      Color(0xFF8E5EF3),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

}
