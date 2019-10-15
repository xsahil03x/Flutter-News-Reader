import 'package:flutter/material.dart';
import 'package:news_reader/core/model/ArticleResponse.dart';
import 'package:news_reader/presentation/blocs/news_bloc.dart';
import 'package:news_reader/presentation/widgets/ArticleRow.dart';
import 'package:provider/provider.dart';

class NewsDetailPage extends StatefulWidget {
  final String id;
  final String channel;

  const NewsDetailPage({Key key, this.id, this.channel}) : super(key: key);

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  NewsBloc _bloc;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_bloc == null) {
      _bloc = Provider.of<NewsBloc>(context);
      _bloc.fetchArticle(widget.id);
    }
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
    return StreamBuilder<ArticleResponse>(
        stream: _bloc.articleResponseStream,
        builder: (context, snapshot) {
          return Container(
            color: Colors.black87,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot?.data?.articles?.length ?? 0,
                itemBuilder: (BuildContext context, int position) =>
                    ArticleRow(snapshot?.data?.articles?.elementAt(position))),
          );
        });
  }
}
