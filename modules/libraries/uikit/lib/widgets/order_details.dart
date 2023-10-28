import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/const/app_dimensions.dart';
import 'package:uikit/const/app_icons.dart';
import 'package:uikit/const/app_palette.dart';

typedef Place = ({String country, String city, String address, int postcode});

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    super.key,
    required this.fullname,
    required this.place,
    this.onEdit,
  });

  final String fullname;
  final Place place;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.orderDetailsHorizontalPadding,
        vertical: AppDimensions.orderDetailsVerticalPadding,
      ),
      decoration: BoxDecoration(
        color: AppPalette.black,
        borderRadius: BorderRadius.circular(AppDimensions.orderDetailsBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullname,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "${place.country}, ${place.city}, ${place.address}, ${place.postcode}",
                  style: const TextStyle(
                    color: Color(0xffFFFBF9),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: onEdit,
            child: SvgPicture.asset(AppIcons.edit),
          )
        ],
      ),
    );
  }
}
