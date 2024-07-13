import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:final_e_commerce/api-helper/api_urls.dart';
import 'package:final_e_commerce/api-helper/models/category_modal.dart';
import '../../api-helper/api_integration.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  ApiRepositry apiRepositry;
  CategoryBloc({required this.apiRepositry}) : super(CategoryInitialState()) {
    on<CategoryDetails>((event, emit) async {
      emit(CategoryLoadingState());
      try{
        var data=await apiRepositry.categoryDetails(urls: apiUrl.categoryUrl);
        if(data !=null){
          var allcategory=CategoryModal.fromJson(data);
          emit(CategoryScucessState(categoryModal: allcategory));
        }else{
          emit(CategoryFailedState(errormsg: "oh oh no data found ..."));
        }
        
      }catch(e){
        emit(CategoryFailedState(errormsg: e.toString()));
      }
      
    });
  }
}
