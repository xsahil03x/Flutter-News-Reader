import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:news_reader/model/News.dart';
import 'package:news_reader/model/NewsResponse.dart';

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  final String apiUrl =
      "https://newsapi.org/v2/sources?apiKey=a4b97f5dd7dd4798bfee7067a3ec323b";
  List<News> news;

  @override
  void initState() {
    super.initState();
    _getUserApi();
  }

  Future<Null> _getUserApi() async {
    var response = await http.get(apiUrl);
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
        title: Text("News Reader"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: makeBody(context),
    );
  }

  Widget makeBody(BuildContext context) => RefreshIndicator(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: makeGridView(context),
        ),
        onRefresh: _getUserApi,
      );

  Widget makeGridView(BuildContext context) => GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        childAspectRatio: 0.75,
      ),
      itemCount: news?.length,
      itemBuilder: (BuildContext context, int position) {
        return makeCard(context, position);
      });

  Widget makeCard(BuildContext context, int position) => Card(
        child: Container(
          decoration: BoxDecoration(color: Colors.cyan),
          child: makeGridTile(context, position),
        ),
      );

  Widget makeGridTile(BuildContext context, int position) => GridTile(
        child: GridTileBar(
          title: Text(
            '${news[position].name}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      );
}
