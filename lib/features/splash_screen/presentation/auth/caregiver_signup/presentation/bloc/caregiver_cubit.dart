import 'dart:convert';

import 'package:api_with_bloc/core/constants/string_const.dart';
import 'package:api_with_bloc/features/splash_screen/presentation/auth/caregiver_signup/domain/model/caregiver_model.dart';
import 'package:api_with_bloc/features/splash_screen/presentation/auth/caregiver_signup/presentation/bloc/caregiver_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CaregiverCubit extends Cubit<CaregiverState> {
  CaregiverCubit() : super(InitialState());

  Future<void> attemptToRegisterCaregiver(
      Map<String, dynamic>? bodyData) async {
    try {
      emit(LoadingState());
      var response = await http.post(
        Uri.parse(StringConst.BASE_URL),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(bodyData),
      );

      if (response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        var result = CaregiverModel.fromJson(data);
        emit(LoadedState(models: result));
      } else {
        emit(FailureState(
            message:
                'Failed to register. Status code: ${response.statusCode}. Body: ${response.body}'));
      }
    } catch (e) {
      emit(FailureState(message: e.toString()));
    }
  }
}
