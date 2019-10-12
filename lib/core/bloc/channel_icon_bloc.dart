import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:news_reader/core/api/icons/icons_api.dart';
import 'package:news_reader/core/model/ChannelIcon.dart';

import '../model/IconsResponse.dart';

class ChannelIconBloc extends BlocBase {
  IconsApi _api;

  ChannelIconBloc() {
    _api = IconsApi();
  }

  Future<List<ChannelIcon>> findIcons(String url) async {
    final response = await _api.findIconsByURL(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      IconsResponse iconsResponse = IconsResponse.fromJson(jsonData);

      print("News icons size is: ${iconsResponse.icons.length}");
      return iconsResponse.icons;
    } else {
      throw Exception('Failed to load news');
    }
  }
}
