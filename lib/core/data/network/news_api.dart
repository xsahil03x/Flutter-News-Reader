import 'package:news_reader/core/model/ArticleResponse.dart';
import 'package:news_reader/core/model/NewsResponse.dart';

abstract class NewsApi {
  Stream<NewsResponse> getNews();
  Future<ArticleResponse> getArticle(String id);
  
}