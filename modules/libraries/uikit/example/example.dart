import 'package:flutter/material.dart';
import 'package:uikit/const/app_palette.dart';
import 'package:uikit/widgets/app_button.dart';

void main(List<String> args) => runApp(const UIKitExample());

const verticalGap20 = SizedBox(height: 20);

class UIKitExample extends StatelessWidget {
  const UIKitExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(),
        ),
      ),
    );
  }
}
