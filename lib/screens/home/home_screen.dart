import 'package:flutter/material.dart';
import 'package:news_app/models/sources_response.dart';
import 'package:news_app/screens/category/category_data.dart';
import 'package:news_app/screens/tab_controller.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

class Home extends StatelessWidget {
 CategoryData categoryData;

 Home(this.categoryData);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResopnse>(
        future: ApiManager.getSources(categoryData.id),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Text(snapshot.data!.message??"");
          }
          if(snapshot.data!.status!='ok'){
            return Center(child: Text(snapshot.data!.message!),);
          }
          var sources=snapshot.data?.sources??[];
          return TabControllerScreen(sources);
        }
    );
  }
}
