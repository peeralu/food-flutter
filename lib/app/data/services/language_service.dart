import 'package:food/app/core/theme/theme.dart';

class LanguageService {
  static final th = Locale('th', 'TH');
  static final en = Locale('en', 'US');

  static Locale get current => Get.locale!;

  static swapLanguage() {
    isTh ? setEn() : setTh();
  }

  static setTh() {
    Get.updateLocale(th);
  }

  static setEn() {
    Get.updateLocale(en);
  }

  static bool get isTh {
    return Get.locale! == th;
  }

  static bool get isEn {
    return Get.locale! == en;
  }

  static String getLanguageApp({required String th, required String en}) {
    return isTh ? th : en;
  }
}
