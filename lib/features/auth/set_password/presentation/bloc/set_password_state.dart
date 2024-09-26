import 'package:api_with_bloc/features/auth/set_password/data/model/set_password_model.dart';

abstract class SetPasswordState {}

class InitialState extends SetPasswordState {}

class LoadingState extends SetPasswordState {}

class LoadedState extends SetPasswordState {
  SetPasswordModel model;
  final String responseMessage;
  LoadedState({required this.model, required this.responseMessage});
}

class FailureState extends SetPasswordState {
  final String message;
  FailureState({required this.message});
}