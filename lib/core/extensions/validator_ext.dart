import 'package:api_with_bloc/core/constants/app_const.dart';

extension ValidatorExt on String {
  bool get isValidEmail {
    return RegExp(AppConst.emailRegex).hasMatch(this);
  }
}