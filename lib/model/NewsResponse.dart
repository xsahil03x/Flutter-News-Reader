import 'package:json_annotation/json_annotation.dart';
import 'package:news_reader/model/News.dart';

class NewsResponse {
  String status;
  @JsonKey(name: 'sources')
  List<News> news;

  NewsResponse({this.status, this.news});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {

    print("newsresponse parsing start");

    List<News> list = List();
    final news = (json['sources'] as List);

    print("news parsing start");

    for (final item in news){
      News news = News.fromJson(item);
      list.add(news);
    }

    print("news parsing stop");

    return NewsResponse(
        status: json['status'],
        news: list
    );
  }
}
