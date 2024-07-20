abstract class DeleteState {}

 class DeleteInitialState extends DeleteState {}

class DeleteLoadingState extends DeleteState {}


class DeleteScucessState extends DeleteState {}


class DeleteFailedState extends DeleteState {
  String errormsg;
  DeleteFailedState({required this.errormsg});
}



