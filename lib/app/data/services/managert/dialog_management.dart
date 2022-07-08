import 'package:food/app/core/theme/dialog/error_dialog.dart';
import 'package:food/app/core/theme/theme.dart';

class DialogManagement {

  Future dialogFailure({Failure? failure, GestureTapCallback? onTapClose}) async {
    final message = failure?.message ?? LocaleKeys.utility_dialog_error_detail.tr;
    ErrorDialog.error(
      message: message,
      onTapClose: () async {
        if (onTapClose != null) onTapClose();
      },
    );
  }
}
