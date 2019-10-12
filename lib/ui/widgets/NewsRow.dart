import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:news_reader/core/bloc/channel_icon_bloc.dart';
import 'package:news_reader/core/model/ChannelIcon.dart';
import 'package:news_reader/core/model/News.dart';
import 'package:news_reader/ui/views/detail/NewsDetailPage.dart';

class NewsRow extends StatefulWidget {
  final News news;

  NewsRow(this.news);

  @override
  _NewsRowState createState() => _NewsRowState();
}

class _NewsRowState extends State<NewsRow> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: GestureDetector(
        onTap: _navigateToDetailsPage,
        child: _buildNewsCard(),
      ),
    );
  }

  void _navigateToDetailsPage() {
    if (widget.news.id.toString().isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewsDetailPage(
            id: widget.news.id,
            channel: widget.news.name,
          ),
        ),
      );
    }
  }

  Widget _buildNewsCard() {
    return Container(
      child: GridTile(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: new Container(
                child: _buildChannelLogo(),
                width: 130.0,
                height: 130.0,
                padding: const EdgeInsets.all(3.0),
                // border width
                decoration: new BoxDecoration(
                  color: Colors.teal, // border color
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 0.0),
              child: Text(
                widget.news.name,
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
        ),
      ),
    );
  }

  Widget _buildChannelLogo() {
    final _bloc = BlocProvider.getBloc<ChannelIconBloc>();

    return FutureBuilder<List<ChannelIcon>>(
      future: _bloc.findIcons(widget.news.url),
      initialData: List(),
      builder: (context, snapshot) {
        try {
          final icons = snapshot.data;

          return new CircleAvatar(
            backgroundImage: new NetworkImage(icons[1].url),
          );
        } catch (Exception) {
          return new CircleAvatar(
            child: new Icon(Icons.library_books),
          );
        }
      },
    );
  }
}
