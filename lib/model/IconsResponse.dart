import 'package:json_annotation/json_annotation.dart';
import 'package:news_reader/model/ChannelIcon.dart';

part 'IconsResponse.g.dart';

@JsonSerializable()
class IconsResponse extends Object with _$IconsResponseSerializerMixin {
  String url;
  List<ChannelIcon> icons;

  IconsResponse(this.url, this.icons);

  factory IconsResponse.fromJson(Map<String, dynamic> json) =>
      _$IconsResponseFromJson(json);
}
