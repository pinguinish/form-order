

// Fake validation
mixin ValidationMixin {
  bool validateEmail(String email) {
    if (email.contains("@")) return true;
    return false;
  }

  bool validatePhone(String phone) {
    if (phone.contains("+")) return true;
    return false;
  }
}