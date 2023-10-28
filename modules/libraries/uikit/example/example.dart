

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) => runApp(const UIKitExample());


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