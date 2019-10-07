// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NewsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) {
  return new NewsResponse(
      json['status'] as String,
      (json['sources'] as List)
          ?.map((e) =>
              e == null ? null : new News.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$NewsResponseSerializerMixin {
  String get status;
  List<News> get news;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'status': status, 'sources': news};
}
