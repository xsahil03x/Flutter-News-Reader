import 'package:json_annotation/json_annotation.dart';

part 'News.g.dart';

@JsonSerializable()
class News extends Object with _$NewsSerializerMixin {
  String country;
  String name;
  String description;
  String language;
  String id;
  String category;
  String url;

  News(this.country, this.name, this.description, this.language, this.id,
      this.category, this.url);

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
