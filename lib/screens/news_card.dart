import 'package:flutter/material.dart';
import 'package:news_app/layout/details_screen/details_screen.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
class NewaCard extends StatelessWidget {
  Articles articles;
  NewaCard(this.articles);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, DetailsScreen.routeName,arguments: articles);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              imageUrl: articles.urlToImage??"",
              height: 180,
            fit: BoxFit.fill,
              placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Colors.green,)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            /*Image.network(articles.urlToImage??"",height: 180,fit: BoxFit.fill,),*/
            Text(articles.author??"",style: TextStyle(fontSize: 14,color: Colors.grey.shade600),),
            Text(articles.title??"",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
            Text(articles.publishedAt!.substring(0,10)??"",textAlign: TextAlign.right,),
          ],
        ),
      ),
    );
  }
}
