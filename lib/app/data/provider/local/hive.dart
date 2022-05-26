import 'package:food/app/data/models/response/auth.dart';
import 'package:food/app/data/models/response/category.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  static Future initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter(AuthAdapter());
    Hive.registerAdapter(MenuAdapter());
    Hive.registerAdapter(CategoryAdapter());
  }

  static Future<Box<E>> openBox<E>({String? key}) async {
    return await Hive.openBox<E>(key ?? E.toString());
  }
}
