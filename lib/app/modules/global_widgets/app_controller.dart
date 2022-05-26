import 'package:food/app/core/theme/theme.dart';

class AppController<Router extends AppRouter> extends GetxController {
  Router router = Get.find<Router>();

  Future dialogFailure({Failure? failure, GestureTapCallback? onTapClose}) async {
    DialogManagement.instead.dialogFailure(failure: failure, onTapClose: onTapClose);
  }
}
