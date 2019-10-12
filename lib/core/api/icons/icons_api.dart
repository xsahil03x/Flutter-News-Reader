import 'package:http/http.dart' as http;

class IconsApi {
  final _endpoint = 'https://i.olsh.me/allicons.json';
  final _headers = {
    "Accept": "application/json",
  };

  /// Fetch icons by given [url]
  Future<http.Response> findIconsByURL(String url) async {
    http.Response response = await http.get(
      Uri.encodeFull('$_endpoint?url=$url'),
      headers: _headers,
    );

    return response;
  }
}
