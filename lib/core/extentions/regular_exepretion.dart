
extension EmailValid on String {
  bool get emailValid => RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(this);
}

extension PasswordValid on String {
  bool get passwordValid => RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$').hasMatch(this);
}