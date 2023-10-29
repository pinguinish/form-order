import 'package:flutter/material.dart';
import 'package:uikit/const/app_palette.dart';
import 'package:uikit/utils/extension/form_order_font_extension.dart';
import 'package:uikit/utils/extension/form_order_palette_extension.dart';

final class FormOrderTheme {
  static const fontFamily = "Roboto";

  static final light = ThemeData(
    fontFamily: fontFamily,
    scaffoldBackgroundColor: const Color(0xffFBFBFB),
    useMaterial3: true,
    extensions: const [
      FormOrderPaletteExtension(
        primaryButton: AppPalette.orange,
        secondaryButton: AppPalette.greyC4,
        primary: AppPalette.greyC1,
        secondary: AppPalette.black,
      ),
      FormOrderFontExtension(
        title: TextStyle(
          color: AppPalette.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );

  // TODO: Replace with real colors
  static final dark = ThemeData(
    fontFamily: fontFamily,
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xffFBFBFB),
    extensions: const [
      FormOrderPaletteExtension(
        primaryButton: AppPalette.orange,
        secondaryButton: AppPalette.greyC4,
        primary: AppPalette.greyC1,
        secondary: AppPalette.black,
      ),
      FormOrderFontExtension(
        title: TextStyle(
          color: AppPalette.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
