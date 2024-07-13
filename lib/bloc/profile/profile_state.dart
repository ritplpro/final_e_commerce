part of 'profile_bloc.dart';


abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileScucessState extends ProfileState {
  ProfileModal profileModal;
  ProfileScucessState({required this.profileModal});
}

class ProfileFailedState extends ProfileState {
  String errormsg;
  ProfileFailedState({required this.errormsg});
}

