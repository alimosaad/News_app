import 'package:flutter/material.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/screens/news_card.dart';
import 'package:news_app/screens/tabitem.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

import '../models/sources_response.dart';

class TabControllerScreen extends StatefulWidget {
  List<Sources> sources;

  TabControllerScreen(this.sources);

  @override
  State<TabControllerScreen> createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              indicatorColor: Colors.transparent,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              isScrollable: true,
              tabs: widget.sources
                  .map((source) => Tab(
                      child: TabItem(source,
                          widget.sources.indexOf(source) == selectedIndex)))
                  .toList(),
            )),
        FutureBuilder<NewsDataModel>(
            future: ApiManager.getNewsData(widget.sources[selectedIndex].id!),
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
            })
      ],
    );
  }
}
