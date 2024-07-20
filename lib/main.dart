import 'package:final_e_commerce/On_boarding/login_page.dart';
import 'package:final_e_commerce/api-helper/api_integration.dart';
import 'package:final_e_commerce/bloc/category/category_bloc.dart';
import 'package:final_e_commerce/bloc/delete_cart/delete_bloc.dart';
import 'package:final_e_commerce/bloc/product_details/details_bloc.dart';
import 'package:final_e_commerce/bloc/signup/signup_bloc.dart';
import 'package:final_e_commerce/bloc/view_cart/viewcart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/craate_order/create_order_bloc.dart';
import 'bloc/login/login_bloc.dart';
import 'bloc/product/products_bloc.dart';
import 'bloc/profile/profile_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => SignupBloc(apiRepositry: ApiRepositry())),
      BlocProvider(create: (context) => LoginBloc(apiRepositry:ApiRepositry())),
      BlocProvider(create: (context) => ProductsBloc(apiRepositry:ApiRepositry())),
      BlocProvider(create: (context) => CategoryBloc(apiRepositry:ApiRepositry())),
      BlocProvider(create: (context) => ProfileBloc(apiRepositry:ApiRepositry())),
      BlocProvider(create: (context) => DetailsBloc(apiRepositry:ApiRepositry())),
      BlocProvider(create: (context) => ViewcartBloc(apiRepositry:ApiRepositry())),
      BlocProvider(create: (context) => DeleteBloc(apiRepositry:ApiRepositry())),
      BlocProvider(create: (context) => CreateOrderBloc(apiRepositry:ApiRepositry())),


    ],
    child: const MyApp(),
  ),);
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
