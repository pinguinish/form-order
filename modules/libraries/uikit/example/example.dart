import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/const/app_palette.dart';
import 'package:uikit/widgets/app_date_picker.dart';
import 'package:uikit/widgets/multiple_address_input.dart';
import 'package:uikit/widgets/app_button.dart';
import 'package:uikit/widgets/app_text_button.dart';
import 'package:uikit/widgets/app_text_field.dart';

void main(List<String> args) => runApp(const UIKitExample());

const verticalGap20 = SizedBox(height: 20);

class UIKitExample extends StatelessWidget {
  const UIKitExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
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
                verticalGap20,
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: AppButton(
                    label: "Next step",
                    onPressed: () {},
                  ),
                ),
                verticalGap20,
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
                verticalGap20,
                AppTextButton(
                  label: "Add address line +",
                  onPressed: () {},
                ),
                verticalGap20,
                AppTextField(
                  hint: "Fullname",
                  prefixIcon: SvgPicture.asset('assets/icons/person.svg'),
                ),
                verticalGap20,
                SizedBox(
                  height: 38,
                  child: AppTextField(
                    hint: "Search",
                    prefixIcon: SvgPicture.asset('assets/icons/search.svg'),
                    prefixIconInnerPadding: const EdgeInsetsDirectional.symmetric(
                      vertical: 10,
                    ),
                  ),
                ),
                verticalGap20,
                MultipleAddressInput(
                  addressMaxCount: 3,
                  onNewAddress: (controller) {
                    addressControllers.add(controller);
                    log("Length: ${addressControllers.length}");
                  },
                ),
                verticalGap20,
                AppDatePicker(
                  onPicked: (value) => log("Date: $value"),
                ),
                verticalGap20
              ],
            ),
          ),
        ),
      ),
    );
  }
}
