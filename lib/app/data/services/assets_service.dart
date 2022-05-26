import 'package:flutter/services.dart' show rootBundle;

class AssetsService {
  static final _assets = "assets/";
  static String asstes(String path) {
    return "$_assets$path";
  }

  static String gif(String name) {
    return asstes("gif/$name");
  }

  static String icon(String name) {
    return asstes("icon/$name");
  }

  static String image(String name) {
    return asstes("image/$name");
  }

  static String svg(String name) {
    return asstes("svg/$name");
  }

  static String json(String name) {
    return asstes("json/$name");
  }

  static Future<String> loadAsset(String key) async {
    return await rootBundle.loadString(key);
  }
}
