import 'package:api_with_bloc/core/constants/string_const.dart';
import 'package:api_with_bloc/features/senior_home_page/data/model/senior_home_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SeniorHomeCubit extends Cubit<SeniorHomeModel> {
  SeniorHomeCubit()
      : super(SeniorHomeModel(firstName: '', lastName: '', email: ''));

  Future<void> attemptToLoadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String firstName = prefs.getString(StringConst.firstName) ?? '';
    String lastName = prefs.getString(StringConst.lastName) ?? '';
    String email = prefs.getString(StringConst.email) ?? '';
    emit(SeniorHomeModel(
        firstName: firstName, lastName: lastName, email: email));
  }
}
