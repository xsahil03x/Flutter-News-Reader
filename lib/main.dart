import 'package:flutter/material.dart';
import 'package:news_reader/core/data/network/i_news_api.dart';
import 'package:news_reader/core/data/repositories/news_repository.dart';
import 'package:news_reader/presentation/blocs/news_bloc.dart';
import 'package:provider/provider.dart';
import 'presentation/views/home/Home.dart';

void main() {
  final newsApi = INewsApi();
  runApp( Provider.value(
        value: NewsBloc(
          NewsRepository(newsApi),
        ),
        child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Nunito'),
    home:Home(),
  )));
}
