import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_order/features/order/widgets/label.dart';
import 'package:uikit/uikit.dart';

class FormOrder extends StatelessWidget {
  const FormOrder({
    super.key,
    required this.fullnameController,
    required this.emailController,
    required this.phoneController,
    required this.countryController,
    required this.cityController,
    required this.postcodeController,
    required this.onNewAddress,
  });

  final TextEditingController fullnameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController countryController;
  final TextEditingController cityController;
  final TextEditingController postcodeController;
  final ValueChanged<TextEditingController> onNewAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(
          label: "Full name*",
          child: AppTextField(
            controller: fullnameController,
            prefixIcon: SvgPicture.asset(AppIcons.person),
          ),
        ),
        AppGap.vertical12,
        Label(
          label: "Email*",
          child: AppTextField(
            controller: emailController,
            prefixIcon: SvgPicture.asset(AppIcons.mail),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        AppGap.vertical12,
        Label(
          label: "Phone number*",
          child: AppTextField(
            controller: phoneController,
            prefixIcon: SvgPicture.asset(AppIcons.phone),
            keyboardType: TextInputType.phone,
          ),
        ),
        AppGap.vertical12,
        Label(
          label: "Country*",
          child: AppTextField(
            controller: countryController,
            prefixIcon: SvgPicture.asset(AppIcons.placeMark),
            keyboardType: TextInputType.text,
          ),
        ),
        AppGap.vertical12,
        Label(
          label: "City*",
          child: AppTextField(
            controller: cityController,
            prefixIcon: SvgPicture.asset(AppIcons.town),
            keyboardType: TextInputType.text,
          ),
        ),
        AppGap.vertical12,
        MultipleAddressInput(
          addressMaxCount: 3,
          onNewAddress: onNewAddress,
        ),
        AppGap.vertical20,
        Label(
          label: "Postcode*",
          child: AppTextField(
            controller: postcodeController,
            prefixIcon: SvgPicture.asset(AppIcons.postcode),
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(6),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
      ],
    );
  }
}
