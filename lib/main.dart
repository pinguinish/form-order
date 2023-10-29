import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form_order/features/order/widgets/order_screen.dart';
import 'package:uikit/const/form_order_theme.dart';

void main() => runZonedGuarded(
      () => runApp(const MainApp()),
      (error, stack) => log(
        "Caught error in runZonedGuarded",
        error: error,
        stackTrace: stack,
        time: DateTime.now(),
      ),
    );

// TODO: Put it to another file
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FormOrderTheme.light,
      darkTheme: FormOrderTheme.dark,
      builder: (context, child) {
        final data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      home: const OrderScreen(),
    );
  }
}
