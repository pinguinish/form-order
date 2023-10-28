import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:uikit/const/app_palette.dart';
import 'package:uikit/widgets/app_text_field.dart';

class AppDatePicker extends StatefulWidget {
  const AppDatePicker({
    super.key,
    this.firstDate,
    this.lastDate,
    required this.onPicked,
    this.hint = "Select date",
  });

  final String hint;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueChanged<DateTime> onPicked;

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  final controller = TextEditingController();

  final datetime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickDate,
      child: AppTextField(
        style: const TextStyle(color: AppPalette.black),
        enabled: false,
        controller: controller,
        hint: widget.hint,
        prefixIcon: SvgPicture.asset('assets/icons/calendar.svg'),
      ),
    );
  }

  Future<void> pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: datetime,
      firstDate: widget.firstDate ?? DateTime(datetime.year),
      lastDate: widget.lastDate ?? DateTime(datetime.year + 2),
    );

    if (date == null) return;
    final format = DateFormat('MMM d, y');
    controller.value = TextEditingValue(text: format.format(date));
    widget.onPicked(date);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
