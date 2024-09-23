class AppConst {
  static const emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const upperCaseRegex = r'[A-Z]';
  static const digitsRegex = r'[0-9]';
  static const specialCharactersRegex = r'[!@#$%^&*(),.?":{}|<>]';
  static const passwordRegex =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
}