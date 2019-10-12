import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:news_reader/core/bloc/news_bloc.dart';
import 'dart:async';
import 'package:news_reader/core/model/News.dart';
import 'package:news_reader/ui/widgets/NewsRow.dart';

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  final _bloc = BlocProvider.getBloc<NewsBloc>();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, _bloc.findNews);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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

  Widget makeBody(BuildContext context) {
    return RefreshIndicator(
      child: Container(
        color: Colors.black87,
        child: makeGridView(context),
      ),
      onRefresh: _bloc.findNews,
    );
  }

  Widget makeGridView(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(2.0, 0, 2.0, 4.0),
      child: StreamBuilder<List<News>>(
        stream: _bloc.newsStream,
        initialData: List(),
        builder: (context, snapshot) {
          final news = snapshot.data;

          return GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 4.0,
            ),
            itemCount: news.length,
            itemBuilder: (BuildContext context, int position) {
              return NewsRow(news[position]);
            },
          );
        },
      ),
    );
  }
}
