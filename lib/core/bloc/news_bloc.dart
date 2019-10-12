import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:news_reader/core/api/news_api.dart';
import 'package:news_reader/core/model/News.dart';
import 'package:rxdart/subjects.dart';

import '../model/NewsResponse.dart';

class NewsBloc extends BlocBase {
  NewsApi _api;
  String _defaultLanguage;

  final _newsStream = BehaviorSubject<List<News>>.seeded(List());

  Stream<List<News>> get newsStream => _newsStream.stream;

  NewsBloc() {
    _api = NewsApi();
    _defaultLanguage = "en";
  }

  @override
  void dispose() {
    _newsStream.close();
    super.dispose();
  }

  Future<void> findNews() async {
    final response = await _api.getNews(_defaultLanguage);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      NewsResponse newsResponse = NewsResponse.fromJson(jsonData);

      _newsStream.add(newsResponse.news);
      print("News list size is: ${newsResponse.news.length}");
    } else {
      throw Exception('Failed to load news');
    }
  }
}
