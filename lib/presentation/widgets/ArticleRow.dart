import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_reader/core/model/Article.dart';
import 'package:news_reader/presentation/views/webview/NewsWebViewPage.dart';

import 'package:timeago/timeago.dart';

class ArticleRow extends StatelessWidget {
  final Article article;

  ArticleRow(this.article);

  @override
  Widget build(BuildContext context) {
    String publishTime(var time) {
      try {
        return timeAgo(DateTime.parse(article.publishedAt));
      } catch (Exception) {
        return "a day ago";
      }
    }

    CircleAvatar articleImage(var url) {
      try {
        return new CircleAvatar(
          backgroundImage: new NetworkImage(url),
        );
      } catch (Exception) {
        return new CircleAvatar(
          child: new Icon(Icons.photo),
        );
      }
    }

    final articleThumbnail = new Container(
      alignment: new FractionalOffset(0.0, 0.5),
      margin: const EdgeInsets.only(left: 16.0),
      child: Container(
          child: articleImage(article.urlToImage),
          width: 100.0,
          height: 100.0,
          padding: const EdgeInsets.all(1.0),
          // border width
          decoration: new BoxDecoration(
            color: Colors.white, // border color
            shape: BoxShape.circle,
          )),
    );

    final articleCard = new Container(
      margin: const EdgeInsets.only(left: 60.0, right: 16.0),
      decoration: new BoxDecoration(
        color: Colors.teal,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(6.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0))
        ],
      ),
      child: new Container(
        margin: const EdgeInsets.only(top: 8.0, left: 68.0,right: 4.0,bottom: 8.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              article.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(color: Colors.white70,
                fontWeight: FontWeight.w800,
                fontSize: 16.0,
              ),
            ),
            new Container(
                color: const Color(0xFF00C6FF),
                width: 36.0,
                height: 1.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0)),
            new Row(
              children: <Widget>[
                new Icon(Icons.access_time,
                    size: 14.0, color: Colors.white70),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: new Text(publishTime(article.publishedAt),style: TextStyle(
                    color: Colors.black87
                  ),),
                ),
              ],
            )
          ],
        ),
      ),
    );

    return Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          if (article.url.toString().isNotEmpty) {
            //_navigateTo(context, article.url);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsWebViewPage(article.url)),
            );
          }
        },
        child: Stack(
          children: <Widget>[
            articleCard,
            articleThumbnail,
          ],
        ),
      ),
    );
  }

//  _navigateTo(context, String url) {
//    Routes.navigateTo(
//        context,
//        '/NewsWebViewPage/${url}',
//        transition: TransitionType.fadeIn
//    );
//  }
}
