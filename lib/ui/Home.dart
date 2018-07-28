import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  List list;


  @override
  Future initState() async {
    List list1 = await _getUserApi();
    setState(() {
      list = list1;
    });
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

  Widget makeBody(BuildContext context) =>
      RefreshIndicator(
        child: makeListView(context),
        onRefresh: _getUserApi,
        color: Colors.amberAccent,
      );

  Widget makeListView(BuildContext context) => ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list?.length,
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
        title: Text('${list[position]['id']}'),
      );


  Future<List> _getUserApi() async {
    String apiUrl = "https://newsapi.org/v2/sources?apiKey=a4b97f5dd7dd4798bfee7067a3ec323b";
    http.Response response = await http.get(apiUrl);
    return JSON.decode(response.body);
  }

}
