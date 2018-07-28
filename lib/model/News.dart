class News {
  String country;
  String name;
  String description;
  String language;
  String id;
  String category;
  String url;

  News({this.country, this.name, this.description, this.language, this.id,
      this.category, this.url});

  factory News.fromJson(Map<String, dynamic> json){

    print("news parsing called.");

    return News(
      country: json['country'],
      name: json['name'],
      description: json['description'],
      language: json['language'],
      id: json['id'],
      category: json['category'],
      url: json['url']
    );
  }
}
