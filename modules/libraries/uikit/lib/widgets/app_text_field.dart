import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uikit/const/app_dimensions.dart';
import 'package:uikit/const/app_palette.dart';

// Defauil border of AppTextField
const _inputBorderSideColor = OutlineInputBorder(
  borderSide: BorderSide(color: AppPalette.greyC3),
  borderRadius: BorderRadius.all(
    Radius.circular(AppDimensions.inputBorderRadius),
  ),
);

// Default inner padding os AppTextField
const _innerPadding = EdgeInsets.all(AppDimensions.inputContentPadding);

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.hint,
    this.controller,
    this.prefixIcon,
    this.prefixIconInnerPadding,
    this.enabled = true,
    this.style,
    this.keyboardType,
    this.inputFormatters,
    this.cursonColor = AppPalette.greyC1,
    this.hintStyle,
  });

  final Color cursonColor;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final bool enabled;
  final String? hint;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final EdgeInsetsDirectional? prefixIconInnerPadding;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      controller: controller,
      cursorColor: cursonColor,
      style: style ?? const TextStyle(color: AppPalette.greyC1),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle ?? const TextStyle(color: AppPalette.greyC2),
        contentPadding: _innerPadding,
        prefixIcon: prefixIcon == null
            ? null
            : Padding(
                padding: prefixIconInnerPadding ?? _innerPadding,
                child: prefixIcon,
              ),
        border: _inputBorderSideColor,
        focusedBorder: _inputBorderSideColor,
      ),
    );
  }
}
