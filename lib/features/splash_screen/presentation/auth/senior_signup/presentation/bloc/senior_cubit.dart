import 'dart:convert';
import 'dart:developer';
import 'package:api_with_bloc/config/env/env.dart';
import 'package:api_with_bloc/features/splash_screen/presentation/auth/senior_signup/domain/model/senior_model.dart';
import 'package:api_with_bloc/features/splash_screen/presentation/auth/senior_signup/presentation/bloc/senior_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class SeniorCubit extends Cubit<SeniorState> {
  SeniorCubit() : super(InitialState());

  Future<void> attemptToRegisterSenior(Map<String, dynamic>? bodyData) async {
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
        log('Response: $response');
        Map<String, dynamic> data = jsonDecode(response.body);
        var result = SeniorModel.fromJson(data);
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
