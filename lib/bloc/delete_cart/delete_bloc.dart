import 'package:bloc/bloc.dart';
import 'package:final_e_commerce/Screens/cart_page.dart';
import 'package:final_e_commerce/api-helper/api_integration.dart';
import 'package:final_e_commerce/api-helper/api_urls.dart';

import 'delete_event.dart';
import 'delete_state.dart';


class DeleteBloc extends Bloc<DeleteEvent, DeleteState> {
  ApiRepositry apiRepositry;

  DeleteBloc({required this.apiRepositry}) : super(DeleteInitialState()) {


    on<deleteCart>((event, emit) {
      emit(DeleteLoadingState());


      try{
         var data=apiRepositry.deleteCard(urls: apiUrl.delete_cartUrl, deleteData:{"cart_id":event.cartId});
         if(data["status"]== true ){
           emit(DeleteScucessState());
         }



      }catch(e){
        emit(DeleteFailedState(errormsg: e.toString()));
      }




    });
  }
}
