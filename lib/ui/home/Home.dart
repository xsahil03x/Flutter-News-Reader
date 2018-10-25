import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:news_reader/model/News.dart';
import 'package:news_reader/model/NewsResponse.dart';
import 'package:news_reader/ui/home/NewsRow.dart';

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  List<News> news;

  @override
  void initState() {
    super.initState();
    _getNewsApi();
  }

  Future<Null> _getNewsApi() async {
    var response = await http.get(
        Uri.encodeFull('https://newsapi.org/v2/sources?language=en'),
        headers: {
          "Accept": "application/json",
          "X-Api-Key": "a4b97f5dd7dd4798bfee7067a3ec323b"
        });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      NewsResponse newsResponse = NewsResponse.fromJson(jsonData);

      setState(() {
        news = newsResponse.news;
        print("News list size is: ${news.length}");
      });

      return null;
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "News Reader",
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: makeBody(context),
    );
  }

  Widget makeBody(BuildContext context) => RefreshIndicator(
        child: Container(
          color: Colors.black87,
          child: makeGridView(context),
        ),
        onRefresh: _getNewsApi,
      );

  Widget makeGridView(BuildContext context) => Container(
        padding:
            EdgeInsets.only(bottom: 4.0, right: 2.0, left: 2.0),
        child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 4.0,
            ),
            itemCount: news?.length,
            itemBuilder: (BuildContext context, int position) =>
              news != null && news.length > position ? NewsRow(news[position]) : null),
      );
}
