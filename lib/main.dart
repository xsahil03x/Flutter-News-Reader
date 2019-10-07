import 'package:flutter/material.dart';


import 'ui/views/home/Home.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Nunito'),
    home:  Home(),
  ));
}


