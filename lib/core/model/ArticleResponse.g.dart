// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArticleResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleResponse _$ArticleResponseFromJson(Map<String, dynamic> json) {
  return new ArticleResponse(
      json['status'] as String,
      json['totalResults'],
      (json['articles'] as List)
          ?.map((e) => e == null
              ? null
              : new Article.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$ArticleResponseSerializerMixin {
  String get status;
  dynamic get totalResults;
  List<Article> get articles;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'totalResults': totalResults,
        'articles': articles
      };
}
