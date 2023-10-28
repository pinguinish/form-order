import 'package:flutter/material.dart';
import 'package:uikit/const/app_palette.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.padding,
    this.labelStyle,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String label;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  final TextStyle? labelStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppPalette.orange,
        side: BorderSide.none,
        shape: const StadiumBorder(),
        padding: padding,
        // The color 0xFF923B0F isn't used anywhere except here
        foregroundColor: foregroundColor ?? const Color(0xFF923B0F),
      ),
      child: Text(
        label,
        style: labelStyle ??
            const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
      ),
    );
  }
}
