import 'package:bloc/bloc.dart';
import 'package:final_e_commerce/api-helper/api_urls.dart';
import 'package:final_e_commerce/api-helper/models/products_modal.dart';
import 'package:final_e_commerce/bloc/product/products_event.dart';
import 'package:final_e_commerce/bloc/product/products_state.dart';

import '../../api-helper/api_integration.dart';


class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ApiRepositry apiRepositry;
  ProductsBloc({required this.apiRepositry}) : super(ProductsInitialState()) {

    on<ProductsEvent>((event, emit) async {
      emit(ProductsLoadingState());

      try{
        var data= await apiRepositry.productsdetails(urls: apiUrl.productUrl);
        if(data!=null){
          var productdata=ProductsModal.fromPJson(data);
          emit(ProductsScucessState(productsModal: productdata));
        }else{
          emit(ProductsFailedState(errormsg: "oh no error occoured..."));
        }


      }catch(e){
       emit(ProductsFailedState(errormsg: e.toString()));
      }

    });
  }
}
