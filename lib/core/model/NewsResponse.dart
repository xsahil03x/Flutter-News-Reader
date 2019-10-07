import 'package:json_annotation/json_annotation.dart';
import 'News.dart';

part 'NewsResponse.g.dart';

@JsonSerializable()
class NewsResponse extends Object with _$NewsResponseSerializerMixin{
  String status;
  @JsonKey(name: 'sources')
  List<News> news;

  NewsResponse(this.status, this.news);

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

}
