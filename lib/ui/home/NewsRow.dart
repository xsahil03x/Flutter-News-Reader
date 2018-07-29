import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:news_reader/Routes.dart';
import 'package:news_reader/model/IconsResponse.dart';
import 'package:news_reader/model/ChannelIcon.dart';
import 'package:news_reader/model/News.dart';
//import 'package:news_reader/Theme.dart' as Theme;

class NewsRow extends StatefulWidget {
  final News news;

  NewsRow(this.news);

  @override
  _NewsRowState createState() => _NewsRowState(news);
}

class _NewsRowState extends State<NewsRow> {
  News news;
  List<ChannelIcon> icons;

  _NewsRowState(News news) {
    this.news = news;
  }

  @override
  void initState() {
    super.initState();
    _getIconsApi();
  }

  Future<Null> _getIconsApi() async {
    var response = await http.get(
        Uri.encodeFull('https://i.olsh.me/allicons.json?url=' + news.url),
        headers: {
          "Accept": "application/json",
        });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      IconsResponse iconsResponse = IconsResponse.fromJson(jsonData);

      setState(() {
        icons = iconsResponse.icons;
        print("News icons size is: ${icons.length}");
      });

      return null;
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    CircleAvatar channelLogo(var url) {
      try {
        return new CircleAvatar(
          radius: 68.0,
          backgroundImage: new NetworkImage(icons[0].url),
        );
      } catch (Exception) {
        return new CircleAvatar(
          radius: 70.0,
          child: new Icon(Icons.library_books),
        );
      }
    }

    final newsCard = Container(
        child: GridTile(
            child: Column(
      children: <Widget>[
        channelLogo(news.url),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, right: 4.0, left: 4.0),
          child: Text(
            news.name,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    )));

    return new Container(child: newsCard);
  }
}
