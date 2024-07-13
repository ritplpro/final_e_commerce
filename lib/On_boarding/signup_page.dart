import 'package:final_e_commerce/On_boarding/login_page.dart';
import 'package:final_e_commerce/bloc/signup/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  var emailController=TextEditingController();
  var passcontroller=TextEditingController();
  var namecontroller=TextEditingController();
  var mobilecontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create account "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("Enter your Name"),
              ],
            ),
            TextField(
              controller:namecontroller,
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
          Text("Mobile number"),
        ],
      ),
      TextField(
        controller:mobilecontroller,
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
           /* BlocListener<SignupBloc,SignupState>(
                listener:(context,state){
                  if(state is SignupLoadingState){
                    Center(child: CircularProgressIndicator());
                  }else if(state is SignupSucessState){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Account created sucessfully ")));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>LoginPage()));
                  }else if( state is SignupErrorState){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${state.errormsg}")));
                  }

                },child:ElevatedButton(onPressed: (){
                 // var mData=SignupModal(email:emailController.text, name:namecontroller.text, password:passcontroller.text, mobno:mobilecontroller.text);

                    context.read<SignupBloc>().add(SignUpuser(name:namecontroller.text, email:emailController.text, mobile_number:mobilecontroller.text, password: passcontroller.text));



            }, child: Text("create Account "))),*/
            BlocConsumer<SignupBloc,SignupState>(
                builder: (context,state){
              if (state is SignupLoadingState){
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
                        Text("Creating account ..."),
                      ],
                    ));
              }
              return ElevatedButton(onPressed: (){


                  context.read<SignupBloc>().add(SignUpuser(name:namecontroller.text, email:emailController.text, mobile_number:mobilecontroller.text, password: passcontroller.text));

              }, child: Text("Cretae"));
            }, listener: (_,state){
              if(state is SignupErrorState){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.deepOrange,
                    content:Text(state.errormsg,style: TextStyle(fontSize: 15),)));
              }else if (state is SignupSucessState){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>LoginPage()));

              }
            })
              




          ],
        ),
      ),
    );
  }
}
