import 'package:bloc/bloc.dart';
import 'package:final_e_commerce/api-helper/api_integration.dart';
import 'package:final_e_commerce/api-helper/api_urls.dart';

import 'create_order_event.dart';
import 'create_order_state.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  ApiRepositry apiRepositry;
  CreateOrderBloc({required this.apiRepositry}) : super(CreateOrderInitialState()) {


    on<CreateOrderEvent>((event, emit) async {
      emit(CreateOrderLoadingState());

      try{
        var data=await apiRepositry.createOrderApi(urls: apiUrl.create_orderUrl);
        if(data["status"]){
          emit(CreateOrderScucessState());

        }else{
          emit(CreateOrderFailedState(errormsg:data["message"].toString()));

        }


      }catch(e){
        emit(CreateOrderFailedState(errormsg: e.toString()));
      }


    });
  }
}
