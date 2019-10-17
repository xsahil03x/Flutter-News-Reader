import 'package:json_annotation/json_annotation.dart';

part 'Article.g.dart';

@JsonSerializable()
class Article {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;

  Article(this.author, this.title, this.description, this.url, this.urlToImage,
      this.publishedAt);

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String,dynamic> toJson() => _$ArticleToJson(this);
}
