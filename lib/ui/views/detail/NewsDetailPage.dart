import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:news_reader/core/bloc/article_bloc.dart';
import 'package:news_reader/core/model/Article.dart';
import 'package:news_reader/ui/widgets/ArticleRow.dart';

class NewsDetailPage extends StatefulWidget {
  final String id;
  final String channel;

  const NewsDetailPage({Key key, this.id, this.channel}) : super(key: key);

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  final _bloc = BlocProvider.getBloc<ArticleBloc>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => _bloc.findArticles(widget.id));
  }

  @override
  void dispose() {
    _bloc.clearArticlesList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.channel,
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
      child: StreamBuilder<List<Article>>(
        stream: _bloc.articlesStream,
        initialData: List(),
        builder: (context, snapshot) {
          final articles = snapshot.data;

          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int position) {
              return ArticleRow(articles[position]);
            },
          );
        },
      ),
    );
  }
}
