
import 'package:final_e_commerce/bloc/craate_order/create_order_bloc.dart';
import 'package:final_e_commerce/bloc/craate_order/create_order_event.dart';
import 'package:final_e_commerce/bloc/craate_order/create_order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_e_commerce/bloc/view_cart/viewcart_bloc.dart';
import 'package:final_e_commerce/bloc/view_cart/viewcart_event.dart';
import 'package:final_e_commerce/bloc/view_cart/viewcart_state.dart';
import 'package:lottie/lottie.dart';

import '../api-helper/models/view_cart_modal.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  num totalAmt=0.0;
  bool hasItems=false;
 

   int? userID;
  bool isOrderplacing=false;
  bool isRemoving=false;
  
  

  @override
  void initState() {
    context.read<ViewcartBloc>().add(ViewCartEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_active)),
        ],
      ),
      body:Column(
        children: [
          Container(
            child: Expanded(
              child: BlocBuilder<ViewcartBloc, ViewcartState>(builder: (context, state) {
                if (state is ViewcartLoadingState) {
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Fetching data.."),
                        SizedBox(width: 10),
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                } else if (state is ViewcartFailedState) {
                  return Center(child: Text("${state.errormsg}"));
                } else if (state is ViewcartScucessState) {
                  if (state.viewCartModal.data != null && state.viewCartModal.data!.isNotEmpty) {
                    hasItems = true; // Set hasItems to true if cart has items
                    return ListView.builder(
                      itemCount: state.viewCartModal.data!.length,
                      itemBuilder: (context, index) {
                        var mdata = state.viewCartModal.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("${index + 1}"),
                                      Container(
                                        height: double.infinity,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: Image.network("${mdata.image}"),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${mdata.name}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Text(
                                            "₹${mdata.price}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Text(
                                            "Quantity: ${mdata.quantity}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  context.read<ViewcartBloc>().add(DeleteCartvent(productid: mdata.id!));
                                                },
                                                icon: Icon(Icons.delete, color: Colors.red),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    hasItems = false; // Set hasItems to false if cart is empty
                    return Container(
                      height: 400,
                      child: Center(child: Lottie.asset("assets/lottie/emptyy.json")),
                    );
                  }
                }
                return Container();
              }),
            ),
          ),
         hasItems == true ? Padding(
           padding: const EdgeInsets.all(30.0),
           child: Column(
             children: [
               TextField(
                 autofocus: true,
                 decoration: InputDecoration(
                     suffixText: "Apply",
                     suffixStyle: TextStyle(color: Colors.orange,
                         fontSize: 17,
                         fontWeight: FontWeight.bold),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                     )
                 ),
               ),
               SizedBox(height: 10,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Subtotal -",style: TextStyle(fontSize: 15),),
                   Text("null",style: TextStyle(fontSize: 15),),
                 ],
               ),
               SizedBox(height: 10,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Total -",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                   Text("null",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                 ],
               ),
               SizedBox(height: 10,),
               checkOut(),




             ],
           ),
         ) :Text("")
        ]
      )
    );
  }





Widget checkOut() {
    return BlocListener<CreateOrderBloc,CreateOrderState>(listener: (context,state){
      if(state is CreateOrderLoadingState){
        isOrderplacing=true;
        setState((){

        });

      }else if(state is CreateOrderFailedState){
        isOrderplacing=false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Failed :${state.errormsg}"))));
        setState(() {

        });
      }else if(state is CreateOrderScucessState){
        isOrderplacing=false;
        showModalBottomSheet(context: context, builder: (context){
          return Container(
            height: 500,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Center(child: Lottie.asset("assets/lottie/placed.json")),
                Center(child: Text("Order placed scucessfully"))
              ],
            ),
          );
        });
        setState(() {

        });
      }
    },
      child: isOrderplacing ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: CircularProgressIndicator()),
          SizedBox(width: 10,),
          ElevatedButton(style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21))
          ),
              onPressed: (){}, child:Text("CheckOut")),
        ],
      ):ElevatedButton(style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21))
      ),
          onPressed: (){
            context.read<CreateOrderBloc>().add(placeOrder());
            setState(() {

            });
          }, child:Text("CheckOut")),);
}






}


