import 'package:http/http.dart' as http;

import 'base_api.dart';

class NewsApi {
  /// Fetch all news from specified [language]
  Future<http.Response> getNews(String language) async {
    http.Response response = await http.get(
      Uri.encodeFull('${BaseApi.ENDPOINT}/sources?language=$language'),
      headers: BaseApi.HEADERS,
    );

    return response;
  }
}
