import 'package:final_e_commerce/api-helper/models/login_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs{

  getToken()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getString("tokens");

  }
  setToken(String tokan) async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.setString("tokens",tokan);


  }


}