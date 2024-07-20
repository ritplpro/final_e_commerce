import 'package:bloc/bloc.dart';
import 'package:final_e_commerce/api-helper/api_integration.dart';
import 'package:final_e_commerce/api-helper/api_urls.dart';
import 'package:final_e_commerce/api-helper/models/view_cart_modal.dart';
import 'package:final_e_commerce/bloc/view_cart/viewcart_event.dart';
import 'package:final_e_commerce/bloc/view_cart/viewcart_state.dart';


class ViewcartBloc extends Bloc<ViewcartEvent, ViewcartState> {
  ApiRepositry apiRepositry;
  ViewcartBloc({required this.apiRepositry}) : super(ViewcartInitialState()) {


    on<ViewcartEvent>((event, emit) async {
      emit(ViewcartLoadingState());

      try{
        var data=await apiRepositry.viewProductCart(urls: apiUrl.view_cartUrl);
        if(data !=null) {
          var alldata= ViewCartModal.fromJson(data);
          emit(ViewcartScucessState(viewCartModal: alldata));
        }else{
          emit(ViewcartFailedState(errormsg: "oh oh no Data found "));
        }



      }catch(e){
        emit(ViewcartFailedState(errormsg: e.toString()));
      }




    });


  }
}
