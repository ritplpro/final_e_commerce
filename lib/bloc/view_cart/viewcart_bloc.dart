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




    on<DeleteCartvent>((event,emit) async {
      emit(ViewcartLoadingState());
      try{
        var data=await apiRepositry.deleteCard(urls: apiUrl.delete_cartUrl, deleteData: {"cart_id":event.productid});
        if(data["status"]==true){
          var cartdata=await apiRepositry.viewProductCart(urls: apiUrl.view_cartUrl);
          if(cartdata !=null){
            var alldada=ViewCartModal.fromJson(cartdata);
            emit(ViewcartScucessState(viewCartModal: alldada));
          }else{
            emit(ViewcartFailedState(errormsg:"Failed to load updated cart data."));
          }

        }else{
          emit(ViewcartFailedState(errormsg: "Failed to delete item."));
        }
        
      }catch(e){
        emit(ViewcartFailedState(errormsg: e.toString()));
      }
      
      
    });


  }
}
