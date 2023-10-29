import 'package:flutter/material.dart';
import 'package:uikit/const/app_gap.dart';
import 'package:uikit/utils/extension/form_order_font_extension.dart';

class Label extends StatelessWidget {
  const Label({
    super.key,
    required this.child,
    required this.label,
    this.margin,
    this.style,
  });

  final String label;
  final Widget child;
  final double? margin;

  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: style ??
              Theme.of(context).extension<FormOrderFontExtension>()?.title,
        ),
        margin == null ? AppGap.vertical8 : SizedBox(height: margin),
        child,
      ],
    );
  }
}
