
import 'package:final_e_commerce/Screens/details_page.dart';
import 'package:final_e_commerce/api-helper/models/products_modal.dart';
import 'package:final_e_commerce/bloc/category/category_bloc.dart';
import 'package:final_e_commerce/bloc/product/products_bloc.dart';
import 'package:final_e_commerce/bloc/product/products_event.dart';
import 'package:final_e_commerce/bloc/product/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    context.read<CategoryBloc>().add(CategoryDetails());
    super.initState();

    context.read<ProductsBloc>().add(products());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var mheight=MediaQuery.of(context).size.height;
    var mwidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){}, icon:Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active))
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(11.0),
        child: Container(
          color: Color(0XFFFFFFFF),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21)
                  )
                ),
              ),
              SizedBox(height: 10,),
              firstContainerBox(),
              SizedBox(height: 10,),
              circlePart(),
              SizedBox(height: 11,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Special for you",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),),
                  Text("See all",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),)
                ],
              ),
              SizedBox(height: 11,),
              SpecialGrid(),



            ],
          ),
        ),
      ),
    );
  }





  Widget circlePart(){
    return BlocBuilder<CategoryBloc,CategoryState>(builder:(context,state){
      if(state is CategoryLoadingState){
        return CircularProgressIndicator();
      }else if(state is CategoryFailedState){
        return Text("${state.errormsg}");
      }else if(state is CategoryScucessState){
        return state.categoryModal.data!= null ?SizedBox(
          height:100,
          child: ListView.builder(scrollDirection:Axis.horizontal,itemCount:state.categoryModal.data!.length,itemBuilder: (context,index){
            var mdata=state.categoryModal.data![index];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child:ClipRRect(
                      child:FlutterLogo(),// add image 
                    ),
                    height:60,
                    width: 60,
                    decoration: BoxDecoration(
                       // color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                ),
                Text("${mdata.name}"),

              ],
            );
          }),
        ) : Center(child: Text('no data found'));
      }
      return Container();
    });
  }








  Widget SpecialGrid(){
    return BlocBuilder<ProductsBloc,ProductsState>(builder:(context,state){
      if(state is ProductsLoadingState){
        return CircularProgressIndicator();
      }else if(state is ProductsFailedState){
        return Text("${state.errormsg}");
      }else if(state is ProductsScucessState){
        return state.productsModal.data !=null ? Expanded(
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio:2/2.40,
              mainAxisSpacing: 10),itemCount:state.productsModal.data!.length,
            itemBuilder: (context,index){
            var mdata=state.productsModal.data![index];
            return Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailsPage(pname:"${mdata.name}",pimage:"${mdata.image}",pPrice: "${mdata.price}",pid:int.parse(mdata.id!))));
                  },
                  child: Container(
                    decoration:BoxDecoration(
                      color: Color(0xFFf5f5f5),
                      borderRadius: BorderRadius.circular(21) ,
                    ),child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      SizedBox(
                        height: MediaQuery.of(context).size.height *0.1,

                        child: ClipRRect(
                            child: Image.network("${mdata.image}",fit: BoxFit.fill,)),
                      ),
                      Text("${mdata.name}",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\₹${mdata.price}",style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height:40,
                                width: MediaQuery.of(context).size.width*.20,
                                child:SizedBox(
                              height:40,
                              child: ListView.builder(scrollDirection:Axis.horizontal,itemCount:5,itemBuilder: (context,index){
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height:30,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.deepOrangeAccent,
                                        borderRadius: BorderRadius.circular(25)
                                    ),
                                  ),
                                );
                              }),
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),),
                ),
                Container(
                  height:MediaQuery.of(context).size.height *.05,
                  width: MediaQuery.of(context).size.width *.09,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                  ),
                  child:IconButton(onPressed: (){}, icon:Icon(Icons.favorite_outline)),
                ),
              ],);
          },),
        ) : Center(child: Text("No Data found .."));
      }
      return Container();
    });
  }









  Widget firstContainerBox(){
    return SizedBox(
      height:MediaQuery.of(context).size.height*.2,
      child: ListView.builder(
          scrollDirection:Axis.horizontal,
          itemCount:5,
          itemBuilder:(context,index){
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            height:150 ,
            width: MediaQuery.of(context).size.width*.9,
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(21)
            ),
          ),
        );

      }),
    );
  }






}
