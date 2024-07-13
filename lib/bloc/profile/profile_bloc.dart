import 'package:bloc/bloc.dart';
import 'package:final_e_commerce/api-helper/api_integration.dart';
import 'package:final_e_commerce/api-helper/api_urls.dart';
import 'package:final_e_commerce/api-helper/models/profile_modal.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ApiRepositry apiRepositry;
  ProfileBloc({required this.apiRepositry}) : super(ProfileInitialState()) {
    on<ProfileEvent>((event, emit) async {
      emit(ProfileLoadingState());
      try{
        var data=await apiRepositry.profiledetails(urls: apiUrl.profileUrl);
        if(data !=null) {
          var alldata = ProfileModal.fromJson(data);
          emit(ProfileScucessState(profileModal: alldata));
        }else{
          emit(ProfileFailedState(errormsg: "oh oh no Data found .."));
        }

      }catch(e){
        emit(ProfileFailedState(errormsg: e.toString()));
      }

    });
  }
}
