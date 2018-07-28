import 'package:json_annotation/json_annotation.dart';
import 'package:news_reader/model/News.dart';

class NewsResponse {
  String status;
  @JsonKey(name: 'sources')
  List<News> news;

  NewsResponse(this.status, this.news);

}
