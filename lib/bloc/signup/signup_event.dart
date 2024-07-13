part of 'signup_bloc.dart';

@immutable
class SignupEvent {}

class SignUpuser extends SignupEvent{
  String name;
  String email;
  String password;
  String mobile_number;
  SignUpuser({required this.name,
    required this.email,
    required this.mobile_number,
    required this.password});
}
