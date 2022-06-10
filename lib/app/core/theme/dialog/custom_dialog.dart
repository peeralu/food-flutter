import 'package:food/app/core/theme/theme.dart';

import 'widget/default_dialog.dart';

class CustomDialog {
  static void logout({
    void Function()? onClose,
    void Function()? onConfirm,
  }) async {
    return Get.dialog(
      DefaultDialog(
        icon: CircleAvatar(
          radius: spaceXXL,
          backgroundColor: AppColors.yellow,
          child: Icon(
            Icons.logout_outlined,
            size: spaceXXXL,
          ),
        ),
        headerSubTitle: LocaleKeys.utility_dialog_logout.tr,
        bodyBackgroundColor: AppColors.lightGray.withOpacity(0.5),
        buttonOne: AppButtonWidget.white(
          title: LocaleKeys.utility_cancel.tr,
          onPressed: () {
            Get.back();
            if (onClose != null) {
              onClose();
            }
          },
        ),
        buttonTwo: AppButtonWidget.yellow(
          title: LocaleKeys.utility_ok.tr,
          onPressed: () {
            Get.back();
            if (onConfirm != null) {
              onConfirm();
            }
          },
        ),
      ),
    );
  }
}
