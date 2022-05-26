import 'package:food/app/core/theme/theme.dart';

import 'widget/default_dialog.dart';
import 'widget/widget/icon.dart';

class ErrorDialog {
  static void error({
    required String message,
    GestureTapCallback? onTapClose,
  }) async {
    return Get.dialog(
      DefaultDialog(
        style: DialogStyle.error,
        icon: IconDialog.error(),
        headerTitle: LocaleKeys.utility_dialog_error.tr,
        bodyTitle: message,
        bodyBackgroundColor: AppColors.lightGray.withOpacity(0.5),
        buttonOne: AppButtonWidget.yellow(
          title: LocaleKeys.utility_close.tr,
          onPressed: () {
            Get.back();
            if (onTapClose != null) {
              onTapClose();
            }
          },
        ),
      ),
    );
  }
}
