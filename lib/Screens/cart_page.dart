import 'package:final_e_commerce/bloc/view_cart/viewcart_bloc.dart';
import 'package:final_e_commerce/bloc/view_cart/viewcart_event.dart';
import 'package:final_e_commerce/bloc/view_cart/viewcart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    context.read<ViewcartBloc>().add(ViewCartEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){}, icon:Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active))
        ],
      ),
      body:makecart(),
    );
  }


  Widget makecart(){
    return BlocBuilder<ViewcartBloc,ViewcartState>(
          builder: (context,state){
            if(state is ViewcartLoadingState){
              return Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Fetching data.."),
                  SizedBox(width: 10,),
                  CircularProgressIndicator(),
                ],
              ));
            }else if(state is ViewcartFailedState){
              return Center(child: Text("${state.errormsg}"));
            }else if(state is ViewcartScucessState){
              return ListView.builder(itemCount: state.viewCartModal.data!.length,
                  itemBuilder: (ccontext,index){
                    var mdata=state.viewCartModal.data![index];
                    return  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("${index+1}"),
                              Container(
                                height: double.infinity,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey.shade200
                                ),
                                child:Image.network("${mdata.image}"),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("${mdata.name}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black54),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("₹${mdata.price}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black54),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Blue",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black54),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Quantity:${mdata.quantity}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black54),),
                                    ],
                                  ),
                                ],
                              ),


                            ],
                          ),
                        ),
                      ),
                    );;

                  });
            }
            return Container();
          });


  }



}
