import 'package:api_with_bloc/features/auth/senior_signup/data/model/senior_model.dart';

abstract class SeniorState {}

class InitialState extends SeniorState {}

class LoadingState extends SeniorState {}

class LoadedState extends SeniorState {
  SeniorModel model;
  final String responseMessage;
  LoadedState({required this.model, required this.responseMessage});
}

class FailureState extends SeniorState {
  final String message;
  FailureState({required this.message});
}
