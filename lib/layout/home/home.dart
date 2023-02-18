import 'package:flutter/material.dart';
import 'package:news_app/models/sources_response.dart';
import 'package:news_app/screens/category/category_data.dart';
import 'package:news_app/screens/category/category_screen.dart';
import 'package:news_app/screens/drower/drower_screen.dart';
import 'package:news_app/screens/home/home_screen.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:news_app/screens/tab_controller.dart';

import '../../models/NewsDataModel.dart';
import '../../screens/news_card.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(
                'assets/images/pattern.png',
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("News"),
          actions: [
            categoryData == null
                ? Container()
                : IconButton(onPressed: () {
                  showSearch(context: context, delegate: newsSearch());
            },
                icon: Icon(Icons.search))
          ],
          backgroundColor: Colors.green,
          centerTitle: true,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
        ),
        drawer: DrowerScreen(onDrawerSelected),
        body: categoryData == null
            ? CategoryScreen(onCategorySelected)
            : Home(categoryData!),
      ),
    );
  }

  CategoryData? categoryData = null;

  void onDrawerSelected(number) {
    if (number == DrowerScreen.SETTINGS) {
    } else if (number == DrowerScreen.CATEGORIES) {
      categoryData = null;
    }
    setState(() {
      Navigator.pop(context);
    });
  }

  void onCategorySelected(categorySelected) {
    categoryData = categorySelected;
    setState(() {});
  }
}

class newsSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        showResults(context);
      }, icon: Icon(Icons.search_rounded))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.close,color: Colors.black,));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsDataModel>(
        future: ApiManager.getNewsData(query:query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Text(snapshot.data!.message ?? "");
          }
          if (snapshot.data!.status != 'ok') {
            return Center(
              child: Text(snapshot.data!.message!),
            );
          }
          var news = snapshot.data?.articles ?? [];
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return NewaCard(news[index]);
              },
              itemCount: news.length,
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("show Suggestion");
  }
  
}
