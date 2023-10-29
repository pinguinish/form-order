import 'package:flutter/material.dart';
import 'package:form_order/features/order/models/order_information_model.dart';
import 'package:uikit/uikit.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    super.key,
    required this.order,
  });

  final OrderInformationModel order;

  @override
  Widget build(BuildContext context) {
    final destination = order.destination;
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 40),
          child: AppTextField(
            hint: "Search",
            prefixIcon: SvgPicture.asset(AppIcons.search),
            prefixIconInnerPadding: const EdgeInsetsDirectional.symmetric(
              vertical: 12,
            ),
          ),
        ),
        AppGap.vertical12,
        OrderDetails(
          fullname: order.user.fullname,
          place: (
            country: destination.country,
            city: destination.city,
            address: destination.address,
            postcode: destination.postcode,
          ),
        ),
      ],
    );
  }
}
