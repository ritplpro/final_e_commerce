import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.share)),
          IconButton(onPressed: (){}, icon:Icon(Icons.favorite_outline)),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children:[
          Column(
          children: [
            Container(
              height:MediaQuery.of(context).size.height*.30,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child: ClipRRect(borderRadius:BorderRadius.circular(3),child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaFBpgrBhGRgGuS3SAC_s-pX0H-o_-VRacSX6qQxZrQg&s",fit:BoxFit.fill,)),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Wireless headfone",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$-520",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
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
        addtoCart(),


        ],
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
    return  Container(
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
                IconButton(onPressed: (){}, icon:Icon(Icons.remove,color: Colors.white,)),
                Text("2",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),),
                IconButton(onPressed: (){}, icon:Icon(Icons.add,color: Colors.white,)),
              ],
            ),
          ),
          ElevatedButton(
              style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange),
              onPressed: (){}, child: Text('Add to Cart',style: TextStyle(color: Colors.white),)),

        ],
      ),
    );
  }
}
