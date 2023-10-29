import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/const/app_icons.dart';
import 'package:uikit/const/app_palette.dart';

class FormOrderAppBar extends StatelessWidget implements PreferredSize {
  const FormOrderAppBar({
    super.key,
  })  : preferredSize = const Size.fromHeight(60),
        child = const SizedBox.shrink();

  @override
  final Widget child;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SvgPicture.asset(AppIcons.arrow),
        ),
      ),
      title: const Text(
        "Ordering",
        style: TextStyle(
          color: AppPalette.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      shape: const LinearBorder(
        side: BorderSide(
          width: 0.5,
          color: Color(0xffE7ECF0),
        ),
        bottom: LinearBorderEdge(),
      ),
    );
  }
}
