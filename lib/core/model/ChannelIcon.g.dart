// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChannelIcon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelIcon _$ChannelIconFromJson(Map<String, dynamic> json) {
  return new ChannelIcon(json['url'] as String, json['height'], json['width'],
      json['format'] as String, json['error']);
}

abstract class _$ChannelIconSerializerMixin {
  String get url;
  dynamic get height;
  dynamic get width;
  String get format;
  Object get error;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'height': height,
        'width': width,
        'format': format,
        'error': error
      };
}
