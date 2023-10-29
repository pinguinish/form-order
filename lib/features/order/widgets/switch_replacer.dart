import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:form_order/features/order/widgets/label.dart';
import 'package:uikit/const/app_gap.dart';
import 'package:uikit/const/app_palette.dart';
import 'package:uikit/utils/extension/form_order_font_extension.dart';
import 'package:uikit/widgets/app_button.dart';

class SwitchReplacer extends StatefulWidget {
  const SwitchReplacer({
    super.key,
    required this.label,
    required this.firstWidget,
    required this.secondWidget,
    this.onSwitch,
  });

  final String label;
  final Widget firstWidget;
  final Widget secondWidget;
  final VoidCallback? onSwitch;

  @override
  State<SwitchReplacer> createState() => _SwitchReplacerState();
}

class _SwitchReplacerState extends State<SwitchReplacer> {
  bool isFirstDisplayed = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(
          label: widget.label,
          style: Theme.of(context)
              .extension<FormOrderFontExtension>()!
              .title
              .copyWith(fontSize: 16),
          child: _SwitchButtons(
            isFirstDisplayed: isFirstDisplayed,
            onFirstButtonPressed: () {
              isFirstDisplayed = true;
              setState(() {});
              widget.onSwitch?.call();
            },
            onSecondButtonPressed: () {
              isFirstDisplayed = false;
              setState(() {});
              widget.onSwitch?.call();
            },
          ),
        ),
        AppGap.vertical20,
        isFirstDisplayed ? widget.firstWidget : widget.secondWidget,
      ],
    );
  }
}

class _SwitchButtons extends StatelessWidget {
  const _SwitchButtons({
    required this.isFirstDisplayed,
    this.onFirstButtonPressed,
    this.onSecondButtonPressed,
  });

  final bool isFirstDisplayed;
  final VoidCallback? onFirstButtonPressed;
  final VoidCallback? onSecondButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 50),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              label: "Add address",
              onPressed: onFirstButtonPressed,
              backgroundColor: isFirstDisplayed ? null : AppPalette.greyC4,
              labelStyle: TextStyle(
                color: isFirstDisplayed ? Colors.white : AppPalette.greyC2,
                fontWeight: FontWeight.normal,
              ),
              foregroundColor: isFirstDisplayed ? null : AppPalette.greyC3,
            ),
          ),
          AppGap.horizontal8,
          Expanded(
            child: AppButton(
              label: "Select address",
              onPressed: onSecondButtonPressed,
              backgroundColor: !isFirstDisplayed ? null : AppPalette.greyC4,
              labelStyle: TextStyle(
                color: !isFirstDisplayed ? Colors.white : AppPalette.greyC2,
                fontWeight: FontWeight.normal,
              ),
              foregroundColor: !isFirstDisplayed ? null : AppPalette.greyC3,
            ),
          ),
        ],
      ),
    );
  }
}
