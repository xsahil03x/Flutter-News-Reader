// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IconsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IconsResponse _$IconsResponseFromJson(Map<String, dynamic> json) {
  return IconsResponse(
    json['url'] as String,
    (json['icons'] as List)
        ?.map((e) =>
            e == null ? null : ChannelIcon.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$IconsResponseToJson(IconsResponse instance) =>
    <String, dynamic>{
      'url': instance.url,
      'icons': instance.icons,
    };
