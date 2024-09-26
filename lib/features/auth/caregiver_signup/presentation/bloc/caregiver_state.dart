import 'package:api_with_bloc/features/auth/caregiver_signup/domain/model/caregiver_model.dart';

abstract class CaregiverState {}

class InitialState extends CaregiverState {}

class LoadingState extends CaregiverState {}

class LoadedState extends CaregiverState {
  CaregiverModel models = CaregiverModel();  
  LoadedState({required this.models});
}

class FailureState extends CaregiverState {
  final String message;
  FailureState({required this.message});
}