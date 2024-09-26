import 'dart:convert';
import 'dart:developer';

import 'package:api_with_bloc/config/env/env.dart';
import 'package:api_with_bloc/features/auth/caregiver_signup/domain/model/caregiver_model.dart';
import 'package:api_with_bloc/features/auth/caregiver_signup/presentation/bloc/caregiver_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CaregiverCubit extends Cubit<CaregiverState> {
  CaregiverCubit() : super(InitialState());

  Future<void> attemptToRegisterCaregiver(
      Map<String, dynamic>? bodyData) async {
    try {
      emit(LoadingState());
      log('Base URL: ${Env.baseUrl}');
      var uri = Uri.parse('${Env.baseUrl}/auth/register');
      log('Full URI: $uri');
      var response = await http.post(
        uri,
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
