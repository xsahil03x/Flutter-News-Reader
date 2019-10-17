import 'package:news_reader/core/data/repositories/news_repository.dart';
import 'package:news_reader/core/model/ArticleResponse.dart';
import 'package:news_reader/core/model/NewsResponse.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc {
  final NewsRepository _newsRepository;
  NewsBloc(this._newsRepository);

  ///
  BehaviorSubject<NewsResponse> _newsResponseSubject =
      BehaviorSubject<NewsResponse>();
  ValueObservable<NewsResponse> get newsResponseStream =>
      _newsResponseSubject.stream;

  Future fetchNews() async {
    _newsRepository.getNews().listen(_newsResponseSubject.add);
  }

  ///

  ///
  BehaviorSubject<ArticleResponse> _articleResponseSubject =
      BehaviorSubject<ArticleResponse>();
  ValueObservable<ArticleResponse> get articleResponseStream =>
      _articleResponseSubject.stream;

  fetchArticle(String id) async {
    final response = await _newsRepository?.getArticle(id);
    _articleResponseSubject.sink.add(response);
  }

  ///

  dispose() {
    _articleResponseSubject.close();
    _newsResponseSubject.close();
  }
}
