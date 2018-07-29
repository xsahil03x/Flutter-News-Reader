// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'News.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return new News(
      json['country'] as String,
      json['name'] as String,
      json['description'] as String,
      json['language'] as String,
      json['id'] as String,
      json['category'] as String,
      json['url'] as String);
}

abstract class _$NewsSerializerMixin {
  String get country;
  String get name;
  String get description;
  String get language;
  String get id;
  String get category;
  String get url;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'country': country,
        'name': name,
        'description': description,
        'language': language,
        'id': id,
        'category': category,
        'url': url
      };
}
