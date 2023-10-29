import 'package:flutter/material.dart';

class FormOrderFontExtension extends ThemeExtension<FormOrderFontExtension> {
  const FormOrderFontExtension({required this.title});

  final TextStyle title;

  @override
  ThemeExtension<FormOrderFontExtension> copyWith({TextStyle? title}) {
    return FormOrderFontExtension(title: title ?? this.title);
  }

  @override
  ThemeExtension<FormOrderFontExtension> lerp(
      covariant ThemeExtension<FormOrderFontExtension>? other, double t) {
    throw ArgumentError(
        "the lerp method isn't supported in FormOrderFontExtension");
  }
}
