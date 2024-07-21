import 'package:final_e_commerce/bloc/allorder_profile/order_bloc.dart';
import 'package:final_e_commerce/bloc/allorder_profile/order_event.dart';
import 'package:final_e_commerce/bloc/allorder_profile/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class AllOrder extends StatefulWidget {


  @override
  State<AllOrder> createState() => _AllOrderState();
}

class _AllOrderState extends State<AllOrder> {

  @override
  void initState() {
    context.read<OrderBloc>().add(GetallOrder());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: Expanded(
        child: BlocBuilder<OrderBloc,OrderState>(builder: (context,state){
          if(state is OrderLoadingState){
            return CircularProgressIndicator();
          }else if(state is OrderFailedState){
            return Text("error${state.errormsg}");
          }else if(state is OrderScucessState){
            return ListView.builder(
              itemCount: state.orderModal.orders!.length,
                itemBuilder: (context,index){
                var oData=state.orderModal.orders![index];
               // var pData=state.orderModal.orders![index].product![index];
               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(21)
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade200,
                        child: Text("${index+1}"),
                      ),
                      Container(
                        width: 150,
                        height: double.infinity,
                        color: Colors.grey.shade200,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
            
                            child:Lottie.asset("assets/lottie/cash.json"),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("${oData.createdAt.toString()}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black54),),
                          Text("${oData.totalAmount}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black54),),
                        ],
                      ),
                    ],
                  ),
            
                             ),
               );
            });
        
          }
          return Container();
        }),
      ),
    );
  }
}
