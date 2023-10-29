import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form_order/core/utils/validation_mixin.dart';
import 'package:form_order/features/order/models/destination_model.dart';
import 'package:form_order/features/order/models/order_information_model.dart';
import 'package:form_order/features/order/models/user_model.dart';
import 'package:form_order/features/order/widgets/form.dart';
import 'package:form_order/features/order/widgets/label.dart';
import 'package:form_order/features/order/widgets/search_list.dart';
import 'package:form_order/features/order/widgets/switch_replacer.dart';
import 'package:uikit/const/app_dimensions.dart';
import 'package:uikit/uikit.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.primaryHorizontalPadding,
            ),
            child: _OrderScreenContent(),
          ),
        ),
      ),
      // Consider to rewrite it CustomScrollView in order to make 
      // AppBar fixed 
      appBar: FormOrderAppBar(),
    );
  }
}

///
///===================[_OrderScreenContent]===================
///

class _OrderScreenContent extends StatefulWidget {
  const _OrderScreenContent();

  @override
  State<_OrderScreenContent> createState() => __OrderScreenContentState();
}

class __OrderScreenContentState extends State<_OrderScreenContent>
    with ValidationMixin {
  late final OrderInfo sender = getAllControllers(
    fullname: _$fakeSentOrder.user.fullname,
    email: _$fakeSentOrder.user.email,
    phone: _$fakeSentOrder.user.phone,
    country: _$fakeSentOrder.destination.country,
    city: _$fakeSentOrder.destination.city,
    postcode: _$fakeSentOrder.destination.postcode.toString(),
  );
  late final OrderInfo receiver = getAllControllers(
    fullname: _$fakeReceviedOrder.user.fullname,
    email: _$fakeReceviedOrder.user.email,
    phone: _$fakeReceviedOrder.user.phone,
    country: _$fakeReceviedOrder.destination.country,
    city: _$fakeReceviedOrder.destination.city,
    postcode: _$fakeReceviedOrder.destination.postcode.toString(),
  );

  OrderInfo getAllControllers({
    String? fullname,
    String? email,
    String? phone,
    String? country,
    String? city,
    String? postcode,
  }) =>
      (
        fullname: TextEditingController(text: fullname),
        email: TextEditingController(text: email),
        phone: TextEditingController(text: phone),
        country: TextEditingController(text: country),
        city: TextEditingController(text: city),
        postcode: TextEditingController(text: postcode),
        addresses: [],
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          AppGap.vertical12,
          const Text("Step 1", style: TextStyle(fontSize: 16)),
          AppGap.vertical20,
          // Date picker
          Label(
            label: "Start date",
            child: AppDatePicker(onPicked: (date) {}),
          ),
          AppGap.vertical48,
          SwitchReplacer(
            label: "Sender details",
            firstWidget: FormOrder(
              fullnameController: sender.fullname,
              emailController: sender.email,
              phoneController: sender.phone,
              countryController: sender.country,
              cityController: sender.city,
              postcodeController: sender.postcode,
              onNewAddress: (value) {
                if (sender.addresses.isEmpty) {
                  value.text = _$fakeSentOrder.destination.address;
                }
                sender.addresses.add(value);
              },
            ),
            secondWidget: const SearchList(order: _$fakeSentOrder),
            onSwitch: () => sender.addresses.clear(),
          ),
          AppGap.vertical56,
          SwitchReplacer(
            label: "Recipient adress",
            firstWidget: FormOrder(
              fullnameController: receiver.fullname,
              emailController: receiver.email,
              phoneController: receiver.phone,
              countryController: receiver.country,
              cityController: receiver.city,
              postcodeController: receiver.postcode,
              onNewAddress: (value) {
                if (receiver.addresses.isEmpty) {
                  value.text = _$fakeReceviedOrder.destination.address;
                }
                receiver.addresses.add(value);
              },
            ),
            secondWidget: const SearchList(order: _$fakeReceviedOrder),
            onSwitch: () => receiver.addresses.clear(),
          ),
          AppGap.vertical36,
          SizedBox(
            width: double.infinity,
            height: 52,
            child: AppButton(
              label: 'Next step',
              onPressed: () {
                if (!validateEmail(sender.email.text)) return;
                if (!validateEmail(receiver.email.text)) return;
                if (!validatePhone(sender.phone.text)) return;
                if (!validatePhone(receiver.phone.text)) return;
                log("Next step");
              },
            ),
          ),
          AppGap.vertical20,
        ],
      ),
    );
  }

  @override
  void dispose() {
    sender.disposeAll();
    receiver.disposeAll();
    super.dispose();
  }
}

// Consider to put these in another file 
typedef OrderInfo = ({
  TextEditingController fullname,
  TextEditingController email,
  TextEditingController phone,
  TextEditingController country,
  TextEditingController city,
  TextEditingController postcode,
  List<TextEditingController> addresses,
});

extension on OrderInfo {
  void disposeAll() {
    this.fullname.dispose();
    this.email.dispose();
    this.phone.dispose();
    this.country.dispose();
    this.city.dispose();
    this.postcode.dispose();
    for (final address in this.addresses) {
      address.dispose();
    }
  }
}

const _$fakeSentOrder = OrderInformationModel(
  user: UserModel(
    firstname: "Egor",
    lastname: "Denilev",
    email: 'egor_zu@email.com',
    phone: '+375726014690',
  ),
  destination: DestinationModel(
    country: 'Belarus',
    city: 'Minsk',
    address: 'Derzhinskogo 3b',
    postcode: 80100,
  ),
);

const _$fakeReceviedOrder = OrderInformationModel(
  user: UserModel(
    firstname: "Ko",
    lastname: "Yuri",
    email: 'yuri@email.com',
    phone: '+375294545687',
  ),
  destination: DestinationModel(
    country: 'Italy',
    city: 'Naple',
    address: 'Via Toledo 256',
    postcode: 220069,
  ),
);
