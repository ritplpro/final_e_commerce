import 'package:bloc/bloc.dart';
import 'package:final_e_commerce/api-helper/api_integration.dart';
import 'package:final_e_commerce/api-helper/api_urls.dart';

import 'details_event.dart';
import 'details_state.dart';


class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  ApiRepositry apiRepositry;

  DetailsBloc({required this.apiRepositry }) : super(DetailsInitialState()) {

    on<DetailsList>((event, emit) async {
      emit(DetailsLoadingState());

      try{
        var data=await apiRepositry.addToCard(urls: apiUrl.add_to_cardUrl, gData:{
          "product_id": event.product_id,
          "quantity":event.quantity
        });

        if(data["status"]=="true"){
          emit (DetailsScucessState());
        }else{
          emit(DetailsFailedState(errormsg: data["message"]));
        }
      }catch(e){
        emit(DetailsFailedState(errormsg: e.toString()));
      }



    });
  }
}
