

import 'dart:convert';
import 'dart:io';

import 'package:final_e_commerce/api-helper/init_prefs.dart';
import 'package:final_e_commerce/api-helper/models/login_modal.dart';
import 'package:http/http.dart'as http;

import 'app_excaption.dart';

class ApiRepositry{

  ///Create account function ...

   registerUser({required String urls,
     required Map<String,dynamic> mData})async{
     var uri=Uri.parse(urls);

     try{
       var response=await http.post(uri,body: jsonEncode(mData));
       return returnhttpresponse(response);

     }on SocketException catch(e){
       throw FetchDataException(errormsg: "No internet${e.message.toString()}");
     }
  }

//Login API function...
   loginUser({required String urls,required LoginModal mData})async{
     var uri=Uri.parse(urls);
     var token=await AppPrefs().getToken();

     try{
       var response=await http.post(uri,body:jsonEncode(mData),headers: {
         "Authorization":"Bearer $token",
         'Content-Type':'application/json'
       });
       return returnhttpresponse(response);

     }on SocketException catch(e){
       throw FetchDataException(errormsg: "No internet${e.message.toString()}");
     }
   }

   //products
  productsdetails({required String urls}) async {
    var uri=Uri.parse(urls);
    var token=await AppPrefs().getToken();

    try{
      var response=await http.post(uri,headers: {
        "Authorization":"Bearer $token",
        'Content-Type':'application/json'
      });
      return returnhttpresponse(response);

    }on SocketException catch(e){
      throw FetchDataException(errormsg: "No internet${e.message.toString()}");
    }
  }

  //category
  categoryDetails({required String urls}) async {
    var uri=Uri.parse(urls);
    var token=await AppPrefs().getToken();

    try{
      var response=await http.get(uri,headers: {
        "Authorization":"Bearer $token",
        'Content-Type':'application/json'});
      return returnhttpresponse(response);

    }on SocketException catch(e){
      throw FetchDataException(errormsg: "No internet${e.message.toString()}");
    }
  }

  //Profile Details

  profiledetails({required String urls}) async {
    var uri=Uri.parse(urls);
    var token=await AppPrefs().getToken();

    try{
      var response=await http.post(uri,headers: {
        "Authorization":"Bearer $token",
        'Content-Type':'application/json'
      });
      return returnhttpresponse(response);

    }on SocketException catch(e){
      throw FetchDataException(errormsg: "No internet${e.message.toString()}");
    }
  }

  //add to card
  addToCard({required String urls,required Map<String,dynamic>gData}) async {
    var uri=Uri.parse(urls);
    var token=await AppPrefs().getToken();

    try{
      var response=await http.post(uri,headers: {
        "Authorization":"Bearer $token",
        'Content-Type':'application/json'
      },body:jsonEncode(gData));
      return returnhttpresponse(response);

    }on SocketException catch(e){
      throw FetchDataException(errormsg: "No internet${e.message.toString()}");
    }
  }


  //view product cart

  viewProductCart({required String urls}) async {
    var uri=Uri.parse(urls);
    var token=await AppPrefs().getToken();

    try{
      var response=await http.get(uri,headers: {
        "Authorization":"Bearer $token",
        'Content-Type':'application/json'});
      return returnhttpresponse(response);

    }on SocketException catch(e){
      throw FetchDataException(errormsg: "No internet${e.message.toString()}");
    }
  }



//reponse body

   dynamic returnhttpresponse(http.Response response){

     switch(response.statusCode){
       case 200:{
        var aData=jsonDecode(response.body);
          return aData;
       }

       case 400:
         throw BadRequestException(errormsg: response.body.toString());
       case 401:
       case 403:
         throw UnAutrosiedException(errormsg: response.body.toString());
       case 500:
       default:
         throw FetchDataException(errormsg:
         "Error occurred while Communication with Server with StatusCode : ${response.statusCode}");
     }

   }

}

