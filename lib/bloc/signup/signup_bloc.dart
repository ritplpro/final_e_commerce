
import 'package:bloc/bloc.dart';
import 'package:final_e_commerce/api-helper/api_urls.dart';
import 'package:final_e_commerce/api-helper/models/login_modal.dart';
import 'package:meta/meta.dart';

import '../../api-helper/api_integration.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  ApiRepositry apiRepositry;

  SignupBloc({required this.apiRepositry}) : super(SignupInitialState()) {


    on<SignUpuser>((event, emit) async {
      emit(SignupLoadingState());
      
      try{
        var datas=await apiRepositry.registerUser(urls: apiUrl.registrationUrl,mData:{"name":event.name,"password":event.password,"mobile_number":event.mobile_number,"email":event.email});
           var ardata=JsonModal.fromJson(datas);
            if(ardata.status!){
              emit(SignupSucessState());
            }
        
      }catch(e){
        emit(SignupErrorState(errormsg: "error${e.toString()}"));
      }


    });
  }
}
