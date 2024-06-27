
import 'package:final_e_commerce/Screens/details_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    );
  }
  Widget circlePart(){
    return SizedBox(
      height:100,
      child: ListView.builder(scrollDirection:Axis.horizontal,itemCount:10,itemBuilder: (context,index){
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height:60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(30)
                ),
              ),
            ),
            Text("name "),

          ],
        );
      }),
    );
  }
  Widget SpecialGrid(){
    return Expanded(
      child: InkWell(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailsPage()));
        },
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
        crossAxisSpacing: 5,
        childAspectRatio:2/2.40,
        mainAxisSpacing: 5),itemCount:18,itemBuilder: (context,index){
          return Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
            Container(
              decoration:BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(21) ,
              ),child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ClipRRect(borderRadius:BorderRadius.circular(15),
                    child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaFBpgrBhGRgGuS3SAC_s-pX0H-o_-VRacSX6qQxZrQg&s",fit: BoxFit.fitHeight,)),
                Text("Wireless Headfone"),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$455"),
                      SizedBox(height:40,width: MediaQuery.of(context).size.width*.3,child: circlecolorPart()),
                    ],
                  ),
                ),
              ],
            ),),
              Container(
                height:MediaQuery.of(context).size.height *.05,
                width: MediaQuery.of(context).size.width *.09,
                decoration: BoxDecoration(
                  color: Colors.limeAccent,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                ),
                child:IconButton(onPressed: (){}, icon:Icon(Icons.favorite_outline)),
              ),
          ],);
        },),
      ),
    );
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
  Widget circlecolorPart(){
    return SizedBox(
      height:40,
      child: ListView.builder(scrollDirection:Axis.horizontal,itemCount:10,itemBuilder: (context,index){
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
}
