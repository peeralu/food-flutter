import 'package:intl/intl.dart';

extension OptionalInt on int? {
  int get defaultData {
    return this ?? 0;
  }
}

extension FormatInt on int {
  String get currencyDefault {
    return NumberFormat("#,###").format(this);
  }
}
