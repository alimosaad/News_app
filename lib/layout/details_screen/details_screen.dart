import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "details";

  @override
  Widget build(BuildContext context) {
    Articles articles = ModalRoute
        .of(context)!
        .settings
        .arguments as Articles;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png',),
              fit: BoxFit.cover)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("News"),
          backgroundColor: Colors.green,
          centerTitle: true,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(6),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CachedNetworkImage(
                  imageUrl: articles.urlToImage ?? "",
                  height: 180,
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator(
                        color: Colors.green,)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                /*Image.network(articles.urlToImage??"",height: 180,fit: BoxFit.fill,),*/
                Text(articles.author ?? "",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),),
                Text(articles.title ?? "", style: TextStyle(fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),),
                Text(articles.publishedAt!.substring(0, 10) ?? "",
                  textAlign: TextAlign.right,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Text(articles.description ?? "",
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    _launchUrl(Uri.parse(articles.url!));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("View Full Article",
                        style: TextStyle(fontSize: 16, color: Colors.black),),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
