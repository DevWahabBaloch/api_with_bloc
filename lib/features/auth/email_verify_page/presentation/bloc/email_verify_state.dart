import 'package:api_with_bloc/features/auth/email_verify_page/data/model/email_verify_model.dart';

abstract class EmailVerifyState {}

class InitialState extends EmailVerifyState {}

class LoadingState extends EmailVerifyState {}

class LoadedState extends EmailVerifyState {
  EmailVerifyModel model;
  final String responseMessage;
  LoadedState({required this.model, required this.responseMessage});
}

class FailureState extends EmailVerifyState {
  final String message;
  FailureState({required this.message});
}