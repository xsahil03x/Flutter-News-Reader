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
    this._getUserApi();
  }

  Future<String> _getUserApi() async {
    var response = await http.get(apiUrl);
    print(response.body);
    setState(() {
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        NewsResponse newsResponse = jsonData;
        news = newsResponse.news;
      } else {
        throw Exception('Failed to load news');
      }
    });
    return "Success";
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
        child: makeListView(context),
        onRefresh: _getUserApi,
      );

  Widget makeListView(BuildContext context) => ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: news?.length,
        itemBuilder: (BuildContext context, int position) {
          return makeCard(context, position);
        },
      );

  Widget makeCard(BuildContext context, int position) => Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: makeListTile(context, position),
        ),
      );

  Widget makeListTile(BuildContext context, int position) => ListTile(
        title: Text('${news[position].name}'),
      );
}
