import 'package:final_e_commerce/api-helper/models/view_cart_modal.dart';

abstract class ViewcartState {}

class ViewcartInitialState extends ViewcartState {}

class ViewcartLoadingState extends ViewcartState {}

class ViewcartScucessState extends ViewcartState {
  ViewCartModal viewCartModal;
  ViewcartScucessState({required this.viewCartModal});
}

class ViewcartFailedState extends ViewcartState {
  String errormsg;
  ViewcartFailedState({required this.errormsg});
}
