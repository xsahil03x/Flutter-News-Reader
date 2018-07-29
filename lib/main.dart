import 'package:flutter/material.dart';
import 'package:news_reader/ui/home/Home.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Nunito'),
    home: new Home(),
  ));
}


