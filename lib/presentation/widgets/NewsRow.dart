import 'package:flutter/material.dart';
import 'package:news_reader/core/model/News.dart';
import 'package:news_reader/presentation/views/detail/NewsDetailPage.dart';


class NewsRow extends StatefulWidget {
  final News news;

  NewsRow(this.news);

  @override
  _NewsRowState createState() => _NewsRowState();
}

class _NewsRowState extends State<NewsRow> {

  @override
  void initState() {
    super.initState();
  }

  // Future<Null> _getIconsApi() async {
  //   var response = await http.get(
  //       Uri.encodeFull('https://i.olsh.me/allicons.json?url=' + news.url),
  //       headers: {
  //         "Accept": "application/json",
  //       });

  //   if (response.statusCode == 200) {
  //     var jsonData = json.decode(response.body);
  //     IconsResponse iconsResponse = IconsResponse.fromJson(jsonData);

  //     setState(() {
  //       icons = iconsResponse.icons;
  //       print("News icons size is: ${icons.length}");
  //     });

  //     return null;
  //   } else {
  //     throw Exception('Failed to load icons');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    CircleAvatar channelLogo(var url) {
      try {
        return new CircleAvatar(
          backgroundImage: new NetworkImage(widget.news.icons[1].url),
        );
      } catch (Exception) {
        return new CircleAvatar(
          child: new Icon(Icons.library_books),
        );
      }
    }

    final newsCard = Container(
        child: GridTile(
            child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: new Container(
              child: channelLogo(widget.news.url),
              width: 130.0,
              height: 130.0,
              padding: const EdgeInsets.all(3.0),
              // border width
              decoration: new BoxDecoration(
                color: Colors.teal, // border color
                shape: BoxShape.circle,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 4.0, left: 4.0),
          child: Text(
           widget. news.name,
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
    return new Container(
      child: GestureDetector(
        onTap: () {
          if (widget.news.id.toString().isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      NewsDetailPage(id: widget.news.id, channel: widget.news.name)),
            );
          }
        },
        child: newsCard,
      ),
    );
  }
}
