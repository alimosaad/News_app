import 'package:flutter/material.dart';
import 'package:news_app/screens/category/category_data.dart';

class CategoryItem extends StatelessWidget {
 CategoryData categoryData;
int index;
 CategoryItem(this.categoryData,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: categoryData.color,
        borderRadius: BorderRadius.only(
          topRight:Radius.circular(25) ,
          topLeft: Radius.circular(25),
          bottomRight:index.isEven?Radius.zero:Radius.circular(25) ,
          bottomLeft:index.isOdd?Radius.zero:Radius.circular(25)
        )
      ),
      child: Column(
        children: [
          Image.asset(categoryData.image,height: 120,),
          Expanded(child: Center(child: Text(categoryData.title))),

        ],
      ),
    );
  }
}
