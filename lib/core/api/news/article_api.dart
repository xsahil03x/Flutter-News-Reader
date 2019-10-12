import 'package:http/http.dart' as http;

import 'base_api.dart';

class ArticleApi {
  /// Fetch all articles from spicified [sourceId]
  Future<http.Response> getArticleBySource(String sourceId) async {
    http.Response response = await http.get(
      Uri.encodeFull('${BaseApi.ENDPOINT}/top-headlines?sources=$sourceId'),
      headers: BaseApi.HEADERS,
    );

    return response;
  }
}
