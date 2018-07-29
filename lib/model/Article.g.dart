// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return new Article(
      json['author'] as String,
      json['title'] as String,
      json['description'] as String,
      json['url'] as String,
      json['urlToImage'] as String,
      json['publishedAt'] as String);
}

abstract class _$ArticleSerializerMixin {
  String get author;
  String get title;
  String get description;
  String get url;
  String get urlToImage;
  String get publishedAt;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt
      };
}
