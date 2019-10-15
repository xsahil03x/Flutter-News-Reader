import 'package:json_annotation/json_annotation.dart';

part 'ChannelIcon.g.dart';

@JsonSerializable()
class ChannelIcon {
  String url;
  var height;
  var width;
  String format;
  Object error;

  ChannelIcon(this.url, this.height, this.width, this.format, this.error);

  factory ChannelIcon.fromJson(Map<String, dynamic> json) => _$ChannelIconFromJson(json);
  Map<String,dynamic> toJson() => _$ChannelIconToJson(this);

}
