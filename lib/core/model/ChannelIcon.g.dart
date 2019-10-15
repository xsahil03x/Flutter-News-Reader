// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChannelIcon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelIcon _$ChannelIconFromJson(Map<String, dynamic> json) {
  return ChannelIcon(
    json['url'] as String,
    json['height'],
    json['width'],
    json['format'] as String,
    json['error'],
  );
}

Map<String, dynamic> _$ChannelIconToJson(ChannelIcon instance) =>
    <String, dynamic>{
      'url': instance.url,
      'height': instance.height,
      'width': instance.width,
      'format': instance.format,
      'error': instance.error,
    };
