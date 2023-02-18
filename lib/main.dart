import 'package:flutter/material.dart';
import 'package:news_app/layout/details_screen/details_screen.dart';
import 'package:news_app/layout/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        HomeScreen.routeName:(_)=>HomeScreen(),
        DetailsScreen.routeName:(_)=>DetailsScreen(),
      },
      initialRoute:HomeScreen.routeName,
      debugShowCheckedModeBanner: false,

    );
  }
}

