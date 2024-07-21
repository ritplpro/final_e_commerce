import 'package:bloc/bloc.dart';
import 'package:final_e_commerce/api-helper/api_integration.dart';
import 'package:final_e_commerce/api-helper/api_urls.dart';
import 'package:final_e_commerce/api-helper/models/order_modal.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  ApiRepositry apiRepositry;
  OrderBloc({required this.apiRepositry }) : super(OrderInitialState()) {

    on<GetallOrder>((event, emit) async {
      emit(OrderLoadingState());

      try{
        var data=await apiRepositry.OrderDetails(urls: apiUrl.get_orderUrl);
        var orderData=OrderModal.fromJson(data);
        if(orderData.status!){
          emit(OrderScucessState(orderModal: orderData));
        }

      }catch(e){
        emit(OrderFailedState(errormsg: e.toString()));
      }


    });
  }
}
