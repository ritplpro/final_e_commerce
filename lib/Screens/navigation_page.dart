import 'package:final_e_commerce/Screens/cart_page.dart';
import 'package:final_e_commerce/Screens/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'fav_page.dart';
import 'home_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  var selectedIndex=0;
  List<Widget> naviBar=[
    MyHomePage(),
    FavouritePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: naviBar[selectedIndex],
      bottomNavigationBar:NavigationBar(destinations: [
        NavigationDestination(icon: Icon(Icons.home),label: "Home"),
        NavigationDestination(icon: Icon(Icons.favorite_outline),label: "Favourite"),
        NavigationDestination(icon: Icon(Icons.add_shopping_cart),label: "My Cart"),
        NavigationDestination(icon: Icon(Icons.person),label: "Profile"),

      ],
        onDestinationSelected: (value){
        setState(() {
          selectedIndex=value;
        });
      },
      selectedIndex: selectedIndex,) ,
    );
  }
}
