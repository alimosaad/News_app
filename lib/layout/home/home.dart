import 'package:flutter/material.dart';
import 'package:news_app/models/sources_response.dart';
import 'package:news_app/screens/category/category_data.dart';
import 'package:news_app/screens/category/category_screen.dart';
import 'package:news_app/screens/drower/drower_screen.dart';
import 'package:news_app/screens/home/home_screen.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:news_app/screens/tab_controller.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName='Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage('assets/images/pattern.png',),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("News"),
          backgroundColor:Colors.green,
          centerTitle: true,
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)
            )
          ),

        ),
        drawer: DrowerScreen(),
        body: categoryData==null?CategoryScreen(onCategorySelected):Home(categoryData!),
      ),
    );
  }

  CategoryData? categoryData=null;

  void onCategorySelected(categorySelected){
    categoryData=categorySelected;
    setState(() {

    });
  }
}
