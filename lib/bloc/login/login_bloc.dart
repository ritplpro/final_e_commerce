import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:final_e_commerce/api-helper/api_urls.dart';
import 'package:final_e_commerce/api-helper/init_prefs.dart';
import 'package:final_e_commerce/bloc/login/login_event.dart';
import '../../api-helper/api_integration.dart';
import '../../api-helper/models/login_modal.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  ApiRepositry apiRepositry;
  LoginBloc({required this.apiRepositry}) : super(LoginInitialState()) {

    on<LoginUserEvent>((event, emit) async {
      emit(LoginLoadingState());
      try{
        var data=await apiRepositry.loginUser(urls: apiUrl.loginUrl,mData:LoginModal(email: event.email, password:event.password));
        var jsonData=JsonModal.fromJson(data);

        if(jsonData.status!){
          AppPrefs().setToken(jsonData.tokan!);
          emit(LoginScucessState());
        }
      }catch(e){
        emit(LoginFailedState(errormsg: e.toString()));
      }


    });
  }
}
