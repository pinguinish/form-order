import 'package:flutter/material.dart';
import 'package:uikit/const/app_palette.dart';
import 'package:uikit/utils/extension/form_order_palette_extension.dart';

final class FormOrderTheme {
  static const fontFamily = "Roboto";

  static final light = ThemeData(
    fontFamily: fontFamily,
    useMaterial3: true,
    extensions: const [
      FormOrderPaletteExtension(
        backgroung: Color(0xffFBFBFB),
        primaryButton: AppPalette.orange,
        secondaryButton: AppPalette.greyC4,
        primary: AppPalette.greyC1,
        secondary: AppPalette.black,
      ),
    ],
  );


  // TODO: Replace with real colors
  static final dark = ThemeData(
    fontFamily: fontFamily,
    useMaterial3: true,
    extensions: const [
      FormOrderPaletteExtension(
        backgroung: Color(0xffFBFBFB),
        primaryButton: AppPalette.orange,
        secondaryButton: AppPalette.greyC4,
        primary: AppPalette.greyC1,
        secondary: AppPalette.black,
      ),
    ],
  );
}
