class AppConstants {
  static RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp mobileRegExp = RegExp(
      r"/(^(\+8801|8801|01|008801))[1|3-9]{1}(\d){8}$");
}
