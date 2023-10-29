final class UserModel {
  const UserModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
  });

  final String firstname;
  final String lastname;
  final String email;
  final String phone;

  String get fullname => "$firstname $lastname";
}
