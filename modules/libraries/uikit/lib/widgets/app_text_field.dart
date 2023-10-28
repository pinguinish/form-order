import 'package:flutter/material.dart';
import 'package:uikit/const/app_palette.dart';

// Default text style of AppTextField
const _textStyleWithColor = TextStyle(color: AppPalette.greyC1);

// Defauil border of AppTextField
const _inputBorderSideColor = OutlineInputBorder(
  borderSide: BorderSide(color: AppPalette.greyC3),
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

// Default inner padding os AppTextField
const _innerPadding = EdgeInsets.all(12);

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.hint,
    this.controller,
    this.prefixIcon,
    this.prefixIconInnerPadding,
  });

  final String? hint;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final EdgeInsetsDirectional? prefixIconInnerPadding;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppPalette.greyC1,
      style: _textStyleWithColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppPalette.greyC2),
        contentPadding: _innerPadding,
        prefixIcon: Padding(
          padding: prefixIconInnerPadding ?? _innerPadding,
          child: prefixIcon,
        ),
        border: _inputBorderSideColor,
        focusedBorder: _inputBorderSideColor,
      ),
    );
  }
}
