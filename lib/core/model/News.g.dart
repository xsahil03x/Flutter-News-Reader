// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'News.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
    json['country'] as String,
    json['name'] as String,
    json['description'] as String,
    json['language'] as String,
    json['id'] as String,
    json['category'] as String,
    json['url'] as String,
    (json['icons'] as List)
        ?.map((e) =>
            e == null ? null : ChannelIcon.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'country': instance.country,
      'name': instance.name,
      'description': instance.description,
      'language': instance.language,
      'id': instance.id,
      'category': instance.category,
      'url': instance.url,
      'icons': instance.icons,
    };
