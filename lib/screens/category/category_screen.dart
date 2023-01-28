import 'package:flutter/material.dart';
import 'package:news_app/screens/category/category_data.dart';
import 'package:news_app/screens/category/categry_item.dart';

class CategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var categories=CategoryData.getCategory();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Column(
        children: [
          Text("Pick Your category of interest",style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 35,

          ),),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12
            ), itemBuilder: (context,index){
              return CategoryItem(categories[index], index);
            }),
          )
        ],
      ),
    );
  }
}
