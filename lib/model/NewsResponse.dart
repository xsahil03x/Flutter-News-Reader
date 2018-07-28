import 'package:news_reader/model/News.dart';

class NewsResponse {
  String status;
  String source;
  String sortBy;
  List<News> news;

  NewsResponse(this.status, this.source, this.sortBy, this.news);
}
