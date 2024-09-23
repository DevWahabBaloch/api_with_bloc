import 'package:api_with_bloc/features/splash_screen/presentation/auth/senior_signup/domain/model/senior_model.dart';

abstract class SeniorState {}

class InitialState extends SeniorState {}

class LoadingState extends SeniorState {}

class LoadedState extends SeniorState {
  SeniorModel models;  
  LoadedState({required this.models});
}

class FailureState extends SeniorState {
  final String message;
  FailureState({required this.message});
}