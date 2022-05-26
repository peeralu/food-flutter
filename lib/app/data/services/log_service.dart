import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/enum/log.dart';

class LogService {
  static LogService get instead => Get.find<LogService>();

  static initialize() async {
    Get.put(
      Logger(
        printer: PrettyPrinter(
          methodCount: 0,
          printEmojis: false,
        ),
      ),
    );
    Get.put(LogService());
  }

  bool checkShowAndHideLog({required LogFilerType type}) {
    switch (type) {
      case LogFilerType.none:
      // case LogFilerType.firebaseMessage:
      case LogFilerType.getx:
      case LogFilerType.backoffice:
        return true;
      default:
        return false;
    }
  }

  /// Log a message at level [Level.verbose].
  void v(dynamic message, {LogFilerType type = LogFilerType.none}) {
    if (checkShowAndHideLog(type: type)) Get.find<Logger>().v(message);
  }

  /// Log a message at level [Level.debug].
  void d(dynamic message, {LogFilerType type = LogFilerType.none}) {
    if (checkShowAndHideLog(type: type)) Get.find<Logger>().d(message);
  }

  /// Log a message at level [Level.info].
  void i(dynamic message, {LogFilerType type = LogFilerType.none}) {
    if (checkShowAndHideLog(type: type)) Get.find<Logger>().i(message);
  }

  /// Log a message at level [Level.warning].
  void w(dynamic message, {LogFilerType type = LogFilerType.none}) {
    if (checkShowAndHideLog(type: type)) Get.find<Logger>().w(message);
  }

  /// Log a message at level [Level.error].
  void e(dynamic message, {LogFilerType type = LogFilerType.none}) {
    if (checkShowAndHideLog(type: type)) Get.find<Logger>().e(message);
  }

  /// Log a message at level [Level.wtf].
  void wtf(dynamic message, {LogFilerType type = LogFilerType.none}) {
    if (checkShowAndHideLog(type: type)) Get.find<Logger>().wtf(message);
  }
}
