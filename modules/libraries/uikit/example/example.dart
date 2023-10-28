import 'package:flutter/material.dart';
import 'package:uikit/const/app_palette.dart';
import 'package:uikit/widgets/app_button.dart';
import 'package:uikit/widgets/app_text_button.dart';

void main(List<String> args) => runApp(const UIKitExample());

const verticalGap20 = SizedBox(height: 20);

class UIKitExample extends StatelessWidget {
  const UIKitExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const UIKitExampleContent(),
    );
  }
}

class UIKitExampleContent extends StatelessWidget {
  const UIKitExampleContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            ],
          ),
        ),
      ),
    );
  }
}
