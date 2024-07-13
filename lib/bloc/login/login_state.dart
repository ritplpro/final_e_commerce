part of 'login_bloc.dart';


abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginScucessState extends LoginState {}


class LoginFailedState extends LoginState {
  String errormsg;
  LoginFailedState({required this.errormsg});
}

