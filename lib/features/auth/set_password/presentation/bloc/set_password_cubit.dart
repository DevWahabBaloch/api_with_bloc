import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:api_with_bloc/config/env/env.dart';
import 'package:api_with_bloc/core/constants/api_const.dart';
import 'package:api_with_bloc/core/constants/app_keys_const.dart';
import 'package:api_with_bloc/features/auth/set_password/data/model/set_password_model.dart';
import 'package:api_with_bloc/features/auth/set_password/presentation/bloc/set_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SetPasswordCubit extends Cubit<SetPasswordState> {
  SetPasswordCubit() : super(InitialState());

  Future<void> attemptToRegisterSetPassword(
      Map<String, dynamic>? bodyData) async {
    emit(LoadingState());
    try {
      log('Base URL: ${Env.baseUrl}');
      var uri = Uri.parse(Env.baseUrl + APIConst.setPassword);
      log('Full URI: $uri');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString(AppKeysConst.TOKEN_KEY);
      log('Access Token: $accessToken');

      if (accessToken == null) {
        emit(FailureState(message: 'Access token not found'));
      }
      var response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader: '$accessToken'
        },
        body: jsonEncode(bodyData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Response: ${response.statusCode}');
        Map<String, dynamic> data = jsonDecode(response.body);
        var result = SetPasswordModel.fromJson(data);
        emit(LoadedState(
            model: result, responseMessage: '${result.responseMessage}'));
      } else {
        emit(FailureState(
            message:
                'Failed to register. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      emit(FailureState(message: e.toString()));
    }
  }
}
