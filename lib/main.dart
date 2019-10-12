import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:news_reader/core/bloc/article_bloc.dart';
import 'package:news_reader/core/bloc/channel_icon_bloc.dart';
import 'package:news_reader/core/bloc/news_bloc.dart';

import 'ui/views/home/Home.dart';

void main() => runApp(NewsApp());

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => NewsBloc()),
        Bloc((i) => ArticleBloc()),
        Bloc((i) => ChannelIconBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "News Reader",
        theme: ThemeData(fontFamily: 'Nunito'),
        home: Home(),
      ),
    );
  }
}
