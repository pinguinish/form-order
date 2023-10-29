import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/const/app_gap.dart';
import 'package:uikit/const/app_icons.dart';
import 'package:uikit/const/app_palette.dart';
import 'package:uikit/const/form_order_theme.dart';
import 'package:uikit/widgets/app_date_picker.dart';
import 'package:uikit/widgets/multiple_address_input.dart';
import 'package:uikit/widgets/app_button.dart';
import 'package:uikit/widgets/app_text_button.dart';
import 'package:uikit/widgets/app_text_field.dart';
import 'package:uikit/widgets/order_details.dart';

void main(List<String> args) => runApp(const UIKitExample());


class UIKitExample extends StatelessWidget {
  const UIKitExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FormOrderTheme.dark,
      darkTheme: FormOrderTheme.dark,
      home: UIKitExampleContent(),
    );
  }
}

class UIKitExampleContent extends StatelessWidget {
  UIKitExampleContent({super.key});

  final addressControllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppGap.vertical20,
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: AppButton(
                    label: "Next step",
                    onPressed: () {},
                  ),
                ),
                AppGap.vertical20,
                SizedBox(
                  height: 33,
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          label: "Add address",
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: AppButton(
                          label: "Select address",
                          onPressed: () {},
                          backgroundColor: AppPalette.greyC4,
                          labelStyle: const TextStyle(
                            color: AppPalette.greyC2,
                          ),
                          foregroundColor: AppPalette.greyC3,
                        ),
                      ),
                    ],
                  ),
                ),
                AppGap.vertical20,
                AppTextButton(
                  label: "Add address line +",
                  onPressed: () {},
                ),
                AppGap.vertical20,
                AppTextField(
                  hint: "Fullname",
                  prefixIcon: SvgPicture.asset(AppIcons.person),
                ),
                AppGap.vertical20,
                SizedBox(
                  height: 40,
                  child: AppTextField(
                    hint: "Search",
                    prefixIcon: SvgPicture.asset(AppIcons.search),
                    prefixIconInnerPadding:
                        const EdgeInsetsDirectional.symmetric(vertical: 12),
                  ),
                ),
                AppGap.vertical20,
                MultipleAddressInput(
                  addressMaxCount: 3,
                  onNewAddress: (controller) {
                    addressControllers.add(controller);
                    log("Length: ${addressControllers.length}");
                  },
                ),
                AppGap.vertical20,
                AppDatePicker(
                  onPicked: (value) => log("Date: $value"),
                ),
                AppGap.vertical20,
                AppTextField(
                  prefixIcon: SvgPicture.asset(AppIcons.placeMark),
                  keyboardType: TextInputType.number,
                  hint: "Postcode",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                AppGap.vertical20,
                const OrderDetails(
                  fullname: "Denilev Egor",
                  place: (
                    country: "Belarus",
                    city: "Minsk",
                    address: "Derzhinskogo 3b",
                    postcode: 80100,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
