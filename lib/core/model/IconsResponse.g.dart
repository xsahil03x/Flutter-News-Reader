// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IconsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IconsResponse _$IconsResponseFromJson(Map<String, dynamic> json) {
  return new IconsResponse(
      json['url'] as String,
      (json['icons'] as List)
          ?.map((e) => e == null
              ? null
              : new ChannelIcon.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$IconsResponseSerializerMixin {
  String get url;
  List<ChannelIcon> get icons;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'url': url, 'icons': icons};
}
