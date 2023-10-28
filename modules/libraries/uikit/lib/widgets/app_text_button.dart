import 'package:flutter/material.dart';
import 'package:uikit/const/app_palette.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.label,
    this.labelStyle,
    this.onPressed,
  });

  final String label;
  final TextStyle? labelStyle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Hey");
      },
      child: Text(
        label,
        style: labelStyle ??
            const TextStyle(
              color: AppPalette.orange,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
