import 'package:json_annotation/json_annotation.dart';
import 'package:news_reader/model/Article.dart';

part 'ArticleResponse.g.dart';

@JsonSerializable()
class ArticleResponse extends Object with _$ArticleResponseSerializerMixin {
  String status;
  var totalResults;
  List<Article> articles;

  ArticleResponse(this.status, this.totalResults, this.articles);

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);
}
