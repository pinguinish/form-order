import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uikit/const/app_palette.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
        prefixIconConstraints: BoxConstraints(maxWidth: 20, maxHeight: 20),
        prefixIcon: SvgPicture.asset(
          'assets/icons/person.svg',
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppPalette.greyC3),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
