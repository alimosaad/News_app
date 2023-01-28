import 'package:flutter/material.dart';
import 'package:news_app/models/sources_response.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:news_app/screens/tab_controller.dart';
class HomeScreen extends StatelessWidget {
  static const String routeName='Home';

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
        body: FutureBuilder<SourcesResopnse>(
          future: ApiManager.getSources(),
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
        ),
      ),
    );
  }
}
