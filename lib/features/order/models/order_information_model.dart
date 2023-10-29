import 'package:form_order/features/order/models/destination_model.dart';
import 'package:form_order/features/order/models/user_model.dart';

final class OrderInformationModel {
  const OrderInformationModel({
    required this.user,
    required this.destination,
  });

  final UserModel user;
  final DestinationModel destination;
}
