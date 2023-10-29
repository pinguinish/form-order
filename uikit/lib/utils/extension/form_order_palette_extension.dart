import 'package:flutter/material.dart';

class FormOrderPaletteExtension
    extends ThemeExtension<FormOrderPaletteExtension> {
  const FormOrderPaletteExtension({
    required this.primaryButton,
    required this.secondaryButton,
    required this.primary,
    required this.secondary,
  });

  final Color primary;
  final Color secondary;
  final Color primaryButton;
  final Color secondaryButton;

  @override
  ThemeExtension<FormOrderPaletteExtension> copyWith({
    Color? backgroung,
    Color? primary,
    Color? secondary,
    Color? primaryButton,
    Color? secondaryButton,
  }) {
    return FormOrderPaletteExtension(
      primaryButton: primaryButton ?? this.primaryButton,
      secondaryButton: secondaryButton ?? this.secondaryButton,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
    );
  }

  @override
  ThemeExtension<FormOrderPaletteExtension> lerp(
    covariant ThemeExtension<FormOrderPaletteExtension> other,
    double t,
  ) {
    if (other is! FormOrderPaletteExtension) return this;

    return FormOrderPaletteExtension(
      primaryButton: Color.lerp(primaryButton, other.primaryButton, t)!,
      secondaryButton: Color.lerp(secondaryButton, other.secondaryButton, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
    );
  }
}
