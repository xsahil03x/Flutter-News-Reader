//import 'package:fluro/fluro.dart';
//import 'package:flutter/material.dart';
//import 'package:news_reader/ui/NewsWebViewPage.dart';
//
//class Routes {
//  static final Router _router = new Router();
//
//  static var NewsWebViewPageHandler =
//      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//    return NewsWebViewPage(params["url"]);
//  });
//
//  static void initRoutes() {
//    _router.define("/ui/NewsWebViewPage/:url", handler: NewsWebViewPageHandler);
//  }
//
//  static void navigateTo(context, String route, {TransitionType transition}) {
//    _router.navigateTo(context, route, transition: transition);
//  }
////  static var planetDetailHandler = new Handler(
////    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
////      return new PlanetDetailPage(params["id"]);
////    });
////
////  static void initRoutes() {
////    _router.define("/detail/:id", handler: planetDetailHandler);
////  }
////
////  static void navigateTo(context, String route, {TransitionType transition}) {
////    _router.navigateTo(context, route, transition: transition);
////  }
//
//}
