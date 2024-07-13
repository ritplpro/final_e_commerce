part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSucessState extends SignupState {}

class SignupErrorState extends SignupState {
  String errormsg;
  SignupErrorState({required this.errormsg});
}

