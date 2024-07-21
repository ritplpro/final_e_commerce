import 'package:final_e_commerce/api-helper/models/order_modal.dart';

abstract class OrderState {}


class OrderInitialState extends OrderState {}

class OrderLoadingState extends OrderState {}

class OrderScucessState extends OrderState {
  OrderModal orderModal;
  OrderScucessState({required this.orderModal});
}

class OrderFailedState extends OrderState {
  String errormsg;
  OrderFailedState({required this.errormsg});
}

