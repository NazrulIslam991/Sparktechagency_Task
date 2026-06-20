import 'package:flutter/material.dart';

import 'font_manager.dart';

// Private generic text style helper
TextStyle _getTextStyle(
    double fontSize,
    String fontFamily,
    FontWeight fontWeight,
    Color color,
    ) {
  // 🔥 FIX: Added fontWeight here, otherwise bold/medium won't work
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

// -----------------------------------------------------------------------------
// TEXT STYLES
// -----------------------------------------------------------------------------

// Light text style
TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.light300,
    color,
  );
}

// Regular text style
TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.light300,
    color,
  );
}

// Regular text style
TextStyle getRegularStyle16_400({
  double fontSize = FontSize.s16,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.light300,
    color,
  );
}
TextStyle getRegularStyle12_400({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.light300,
    color,
  );
}
TextStyle getRegularStyle14_400({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.semiBold600,
    color,
  );
}

// Medium text style
TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.medium500,
    color,
  );
}

// Medium text style
TextStyle getMediumStyle18_500({
  double fontSize = FontSize.s18,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.medium500,
    color,
  );
}
TextStyle getMediumStyle14_500({
  double fontSize = FontSize.s14,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.medium500,
    color,
  );
}
TextStyle getMediumStyle12_500({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.medium500,
    color,
  );
}
TextStyle getMediumStyle16_500({
  double fontSize = FontSize.s16,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.medium500,
    color,
  );
}

// SemiBold text style
TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s14,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.semiBold600,
    color,
  );
}

TextStyle getSemiBoldStyle28_600({
  double fontSize = FontSize.s28,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.semiBold600,
    color,
  );
}
TextStyle getSemiBoldStyle18_600({
  double fontSize = FontSize.s18,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.semiBold600,
    color,
  );
}
TextStyle getSemiBoldStyle16_600({
  double fontSize = FontSize.s16,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.semiBold600,
    color,
  );
}


// Bold text style
TextStyle getBoldStyle({double fontSize = FontSize.s24, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.bold700,
    color,
  );
}
