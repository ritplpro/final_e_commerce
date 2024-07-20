

abstract class CreateOrderState {}


class CreateOrderInitialState extends CreateOrderState {}

class CreateOrderFailedState extends CreateOrderState {
  String errormsg;
  CreateOrderFailedState({required this.errormsg});
}

class CreateOrderScucessState extends CreateOrderState {}

class CreateOrderLoadingState extends CreateOrderState {}
