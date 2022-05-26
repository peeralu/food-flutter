import 'package:food/app/core/theme/theme.dart';

class Loading {
  static void show() {
    EasyLoading.show(
      status: "Loading...",
      maskType: EasyLoadingMaskType.black,
    );
  }

  static void dismiss() {
    EasyLoading.dismiss();
  }
}
