

import 'package:final_e_commerce/Screens/all_order.dart';
import 'package:final_e_commerce/bloc/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileBloc>().add(profileDetails());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocBuilder<ProfileBloc,ProfileState>(builder: (context,state){
        if(state is ProfileLoadingState){
          return Center(child: CircularProgressIndicator());
        }else if(state is ProfileFailedState){
          return Center(child: Text("${state.errormsg}"));
        }else if(state is ProfileScucessState){
          return state.profileModal.data!=null ? Padding(
            padding: const EdgeInsets.all(11.0),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 50,),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white70,
                    backgroundImage: state.profileModal.data!.image == "" ? NetworkImage("${state.profileModal.data!.image}"): AssetImage("assets/images/profile.png")
                  ),

                  SizedBox(height: 20,),
                  Center(child: Text("${state.profileModal.data!.name}",style: TextStyle(fontSize:21,fontWeight: FontWeight.bold,color: Colors.grey),)),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.phone,color: Colors.grey,),
                          SizedBox(width: 10),
                          Text("Phone - ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey.shade700),),
                        ],
                      ),
                      Text("+91-${state.profileModal.data!.mobileNumber}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey.shade700),),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.mail,color: Colors.grey),
                          SizedBox(width: 10),
                          Text("Email - ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey.shade700),),
                        ],
                      ),
                      Text("${state.profileModal.data!.email}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey.shade700),),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time,color: Colors.grey),
                          SizedBox(width: 10),
                          Text("Create at - ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey.shade700),),
                        ],
                      ),
                      Text("${state.profileModal.data!.createdAt.toString()}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey.shade700),),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time,color: Colors.grey),
                          SizedBox(width: 10),
                          Text("Updated at - ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey.shade700),),
                        ],
                      ),
                      Text("${state.profileModal.data!.updatedAt.toString()}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey.shade700),),
                    ],
                  ),
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.logout),
                          SizedBox(width: 10),
                          TextButton(onPressed: (){}, child: Text("Logout  ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.orange),)),
                        ],
                      ),


                      ElevatedButton(style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder()
                      ),
                          onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>AllOrder()));
                          }, child: Text("Orders")),
                    ],
                  )



                ],
              ),
            ),
          ):Center(child: Text("No Data found"));
        }
        return Container();
      }),
    );
  }


}
