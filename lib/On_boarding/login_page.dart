import 'package:final_e_commerce/On_boarding/signup_page.dart';
import 'package:final_e_commerce/Screens/navigation_page.dart';
import 'package:final_e_commerce/bloc/login/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login/login_bloc.dart';

class LoginPage extends StatelessWidget {
  var emailController=TextEditingController();
  var passcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("Email Address"),
              ],
            ),
            TextField(
              controller:emailController,
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21)
                )
              ),
            ),
            SizedBox(height: 11,),
            Row(
              children: [
                Text("Password"),
              ],
            ),
            TextField(
              controller:passcontroller,
              keyboardType: TextInputType.text,
              autofocus: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                  )
              ),
            ),
            SizedBox(height: 21,),
            BlocConsumer<LoginBloc,LoginState>(
                builder: (context,state){
                  if (state is LoginLoadingState){

                     return ElevatedButton(
                         onPressed: (){},
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: CircularProgressIndicator(),
                             ),
                             SizedBox(width: 11,),
                             Text("Loging account ..."),
                           ],
                         ));
                  }
                  return ElevatedButton(onPressed: (){

                      context.read<LoginBloc>().add(LoginUserEvent(
                          email:emailController.text,
                          password: passcontroller.text));

                  }, child: Text("Login Account"));
                }, listener: (_,state){
              if(state is LoginFailedState){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.deepOrange,
                    content:Text(state.errormsg,style: TextStyle(fontSize: 15),)));
              }else if (state is LoginScucessState){

                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>NavigationPage()));

              }
            }),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don`t have Acct"),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                }, child:Text("Create account?. ",style: TextStyle(fontWeight: FontWeight.bold),))
              ],
            ),



          ],
        ),
      ),
    );
  }
}
