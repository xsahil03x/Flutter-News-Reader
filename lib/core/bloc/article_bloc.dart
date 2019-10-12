import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:news_reader/core/api/news/article_api.dart';
import 'package:news_reader/core/model/Article.dart';
import 'package:rxdart/rxdart.dart';

import '../model/ArticleResponse.dart';

class ArticleBloc extends BlocBase {
  ArticleApi _api;

  final _articlesStream = BehaviorSubject<List<Article>>.seeded(List());

  Stream<List<Article>> get articlesStream => _articlesStream.stream;

  ArticleBloc() {
    _api = ArticleApi();
  }

  @override
  void dispose() {
    _articlesStream.close();
    super.dispose();
  }

  Future<void> findArticles(String sourceId) async {
    final response = await _api.getArticleBySource(sourceId);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      ArticleResponse articleResponse = ArticleResponse.fromJson(jsonData);

      _articlesStream.add(articleResponse.articles);
      print("Articles list size is: ${articleResponse.articles.length}");
    } else {
      throw Exception('Failed to load Articles');
    }
  }

  void clearArticlesList() {
    _articlesStream.add(List());
  }
}
