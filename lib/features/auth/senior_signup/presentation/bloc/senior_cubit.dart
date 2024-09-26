import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:api_with_bloc/config/env/env.dart';
import 'package:api_with_bloc/core/constants/api_const.dart';
import 'package:api_with_bloc/core/constants/app_keys_const.dart';
import 'package:api_with_bloc/features/auth/senior_signup/data/model/senior_model.dart';
import 'package:api_with_bloc/features/auth/senior_signup/presentation/bloc/senior_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SeniorCubit extends Cubit<SeniorState> {
  SeniorCubit() : super(InitialState());

  Future<void> attemptToRegisterSenior(Map<String, dynamic>? bodyData) async {
    emit(LoadingState());
    try {
      log('Base URL: ${Env.baseUrl}');
      var uri = Uri.parse(Env.baseUrl + APIConst.signUp);
      log('Full URI: $uri');
      var response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader: 'BearerToken'
        },
        body: jsonEncode(bodyData),
      );

      if (response.statusCode == 201) {
        log('Response: ${response.body}');

        Map<String, dynamic> data = jsonDecode(response.body);
        String? accessToken = data['responseData']['token']['accessToken'];
        if (accessToken != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString(AppKeysConst.TOKEN_KEY, accessToken);
          log('Access Token to be saved: $accessToken');
        }
        var result = SeniorModel.fromJson(data);
        emit(LoadedState(
            model: result, responseMessage: '${result.responseMessage}'));
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
