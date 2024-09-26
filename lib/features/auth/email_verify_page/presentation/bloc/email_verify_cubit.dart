import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:api_with_bloc/config/env/env.dart';
import 'package:api_with_bloc/core/constants/api_const.dart';
import 'package:api_with_bloc/core/constants/app_keys_const.dart';
import 'package:api_with_bloc/features/auth/email_verify_page/data/model/email_verify_model.dart';
import 'package:api_with_bloc/features/auth/email_verify_page/presentation/bloc/email_verify_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EmailVerifyCubit extends Cubit<EmailVerifyState> {
  EmailVerifyCubit() : super(InitialState());

  Future<void> attemptToRegisterVerifyEmail(
      Map<String, dynamic>? bodyData) async {
    emit(LoadingState());
    try {
      log('Base URL: ${Env.baseUrl}');
      var uri = Uri.parse(Env.baseUrl + APIConst.verifyEmail);
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
          HttpHeaders.authorizationHeader: '$accessToken',
        },
        body: jsonEncode(bodyData),
      );

      log('Response Body: ${response.body}');

      log('Response: ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        var result = EmailVerifyModel.fromJson(data);
        emit(LoadedState(
            model: result, responseMessage: '${result.responseMessage}'));
      } else {
        emit(FailureState(
            message:
                'Failed to verify email. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      emit(FailureState(message: e.toString()));
    }
  }
}
