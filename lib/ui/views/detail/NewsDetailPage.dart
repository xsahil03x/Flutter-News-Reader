import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:news_reader/core/model/Article.dart';
import 'package:news_reader/core/model/ArticleResponse.dart';
import 'package:news_reader/ui/widgets/ArticleRow.dart';

class NewsDetailPage extends StatefulWidget {
  final String id;
  final String channel;

  const NewsDetailPage({Key key, this.id, this.channel}) : super(key: key);

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState(id, channel);
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  //News news;
  String id;
  String channelName;
  List<Article> articles;

  _NewsDetailPageState(String id, String channel) {
    this.id = id;
    this.channelName = channel;
  }

  @override
  void initState() {
    super.initState();
    _getArticlesApi();
  }

  Future<Null> _getArticlesApi() async {
    var response = await http.get(
        Uri.encodeFull('https://newsapi.org/v2/top-headlines?sources=' + id),
        headers: {
          "Accept": "application/json",
          "X-Api-Key": "a4b97f5dd7dd4798bfee7067a3ec323b"
        });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      ArticleResponse articleResponse = ArticleResponse.fromJson(jsonData);

      setState(() {
        articles = articleResponse.articles;
        print("Articles list size is: ${articles.length}");
      });

      return null;
    } else {
      throw Exception('Failed to load Articles');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          channelName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: makeBody(context),
    );
  }

  Widget makeBody(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: articles?.length ?? 0,
          itemBuilder: (BuildContext context, int position) =>
              ArticleRow(articles[position])),
    );
  }
}
