import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:news_reader/Routes.dart';
import 'package:news_reader/model/Article.dart';
import 'package:timeago/timeago.dart';
import 'package:news_reader/Theme.dart' as Theme;

class ArticleRow extends StatelessWidget {
  final Article article;
  final FlutterWebviewPlugin webViewPlugin = new FlutterWebviewPlugin();
  ArticleRow(this.article);

  @override
  Widget build(BuildContext context) {
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
        color: Theme.Colors.planetCard,
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
        margin: const EdgeInsets.only(top: 16.0, left: 72.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              article.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            new Container(
                color: const Color(0xFF00C6FF),
                width: 24.0,
                height: 1.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0)),
            new Row(
              children: <Widget>[
                new Icon(Icons.location_on,
                    size: 14.0, color: Theme.Colors.planetDistance),
                new Text(timeAgo(DateTime.parse(article.publishedAt)),
                    style: Theme.TextStyles.planetDistance),
                new Container(width: 24.0),
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
            webViewPlugin.launch(article.url);
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

//  _navigateTo(context, String id) {
//    Routes.navigateTo(
//        context,
//        '/ui/NewsWebViewPage/${article.url}',
//        transition: TransitionType.fadeIn
//    );
//  }
}
