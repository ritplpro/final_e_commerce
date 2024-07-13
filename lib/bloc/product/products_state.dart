


import 'package:final_e_commerce/api-helper/models/products_modal.dart';

abstract class ProductsState {}

 class ProductsInitialState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsScucessState extends ProductsState {
  ProductsModal productsModal;
  ProductsScucessState({required this.productsModal});
}

class ProductsFailedState extends ProductsState {
  String errormsg;
  ProductsFailedState({required this.errormsg});
}
