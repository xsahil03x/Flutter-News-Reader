import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:news_reader/ui/detail/NewsDetailPage.dart';

class Routes {
  static final Router _router = new Router();

  static var newsDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new NewsDetailPage();
    });

  static void initRoutes() {
    _router.define("/detail/:id", handler: newsDetailHandler);
  }

  static void navigateTo(context, String route, {TransitionType transition}) {
    _router.navigateTo(context, route, transition: transition);
  }

}