import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/models/sources_response.dart';

import '../../constant/constant.dart';
class ApiManager{

  static Future<SourcesResopnse> getSources() async {
    var URL =Uri.https(base,'/v2/top-headlines/sources',{
      'apiKey':apiKey,
    });
    Response sources=await http.get(URL);
    var json =jsonDecode(sources.body);
    SourcesResopnse sourcesResopnse=SourcesResopnse.fromJson(json);
    return sourcesResopnse;
  }
  static Future<NewsDataModel> getNewsData(String sourceId) async {
    Uri URL=Uri.https(base,'/v2/everything',{
      'apiKey':apiKey,
      'sources':sourceId,
    });
    Response response=await http.get(URL);
    var json =jsonDecode(response.body);
    NewsDataModel newsDataModel=NewsDataModel.fromJson(json);
    return newsDataModel;
  }
}