


import 'dart:io';

import 'package:final_e_commerce/bloc/product_details/details_bloc.dart';
import 'package:final_e_commerce/bloc/product_details/details_event.dart';
import 'package:final_e_commerce/bloc/product_details/details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatefulWidget {
  String? pname;
  String?  pimage;
  int?  pid;
  String?  pPrice;
  
   DetailsPage({ required this.pid,required this.pimage,required this.pname,required this.pPrice});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var quty=1;
  bool isLoading=false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.share)),
          IconButton(onPressed: (){}, icon:Icon(Icons.favorite_outline)),
        ],
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children:[
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
              children: [
                Container(
                  height:MediaQuery.of(context).size.height*.30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: ClipRRect(borderRadius:BorderRadius.circular(3),child: Image.network("${widget.pimage}",fit:BoxFit.fitHeight,)),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("${widget.pname}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\₹${widget.pPrice}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                    Text("Seller: abcd man ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),

                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 50,
                      decoration:BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(23)
                      ) ,
                      child: Center(child: Text("⭑4.8")),
                    ),
                    Text("(320 reviews)",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Color",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                  ],
                ),
                circlecolorPart(),
                SizedBox(height: 10,),





              ],
                        ),
            ),
          addtoCart(),
        
        
          ],
        ),
      ),
    );
  }

  Widget circlecolorPart(){
    return SizedBox(
      height:40,
      child: ListView.builder(scrollDirection:Axis.horizontal,itemCount:4,itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            height:30,
            width: 35,
            decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(30)
            ),
          ),
        );
      }),
    );
  }

  Widget addtoCart(){
    return  Padding(
      padding: const EdgeInsets.all(11.0),
      child: Container(
        height: 70,
        decoration:BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 40,
              width:MediaQuery.of(context).size.width*.30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(23),
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){
                    if(quty>1){
                      quty--;
                    }
                    setState(() { });
                  }, icon:Icon(Icons.remove,color: Colors.white,)),
                  Text("${quty}",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),),
                  IconButton(onPressed: (){
                    quty++;
                    setState(() { });
                  }, icon:Icon(Icons.add,color: Colors.white,)),
                ],
              ),
            ),
            BlocListener<DetailsBloc,DetailsState>(
              listener: (context,state){
                if (state is DetailsLoadingState){
                   isLoading=true;
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("adding..."))));
                  setState(() {

                  });
                }else if (state is DetailsScucessState){
                  isLoading=false;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("add to cart scussfull...")));
                  setState(() {

                  });

                }else if(state is DetailsFailedState){
                  isLoading=false;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${state.errormsg}")));
                  setState(() {

                  });

                }

              },
              child: isLoading ? Row(
                children: [
                  CircularProgressIndicator(),
                ],
              ):ElevatedButton(
                  style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange),
                  onPressed: (){
                    var mid=widget.pid;
                    print(mid);
                    context.read<DetailsBloc>().add(DetailsList(product_id:mid, quantity:quty));
                  }, child: Text('Add to Cart',style: TextStyle(color: Colors.white),)),
            ),

          ],
        ),
      ),
    );
  }
}
