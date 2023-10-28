import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uikit/const/app_gap.dart';
import 'package:uikit/const/app_icons.dart';
import 'package:uikit/utils/widget_expander_controller.dart';
import 'package:uikit/widgets/app_text_button.dart';
import 'package:uikit/widgets/app_text_field.dart';

class MultipleAddressInput extends StatefulWidget {
  const MultipleAddressInput({
    super.key,
    this.addressMaxCount = 5,
    this.onNewAddress,
  });

  final int addressMaxCount;
  final void Function(TextEditingController)? onNewAddress;

  @override
  State<MultipleAddressInput> createState() => _AddableAdressInputState();
}

class _AddableAdressInputState extends State<MultipleAddressInput> {
  late final widgetExpanderController = WidgetExpanderController(
    children: _newChildrens(controller),
    emitter: (_, w) => _emitter(w),
  );
  late final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.onNewAddress?.call(controller);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widgetExpanderController,
      builder: (_, widgets, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets,
        );
      },
    );
  }

  // Returns an emitter that can add a new item
  Widget _emitter(List<Widget> children) {
    return AppTextButton(
      label: "Add address line +",
      onPressed: () {
        final addressCount = (children.length ~/ 4) + 1;

        proceessAddingWidget() {
          final itemController = TextEditingController();

          final nextChildren = _newChildrens(
            itemController,
            addressCount,
          );
          widgetExpanderController.all(nextChildren);
          widgetExpanderController.addDisposable(itemController);
          widget.onNewAddress?.call(itemController);
        }

        if (addressCount >= widget.addressMaxCount) {
          proceessAddingWidget();
          widgetExpanderController.removeEmitter();
          return;
        }

        proceessAddingWidget();
      },
    );
  }

  // Returns a single item which will be added into List<Widget>
  // by WidgetExpanderController
  List<Widget> _newChildrens(
    TextEditingController controller, [
    int addressLine = 1,
  ]) =>
      [
        Text("Address line $addressLine*"),
        AppGap.vertical8,
        AppTextField(
          controller: controller,
          hint: "Address",
          prefixIconInnerPadding: const EdgeInsetsDirectional.symmetric(
            vertical: 10,
          ),
          prefixIcon: SvgPicture.asset(AppIcons.address),
        ),
        AppGap.vertical8,
      ];

  @override
  void dispose() {
    controller.dispose();
    widgetExpanderController.dispose();
    super.dispose();
  }
}
