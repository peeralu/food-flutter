import 'package:food/app/core/theme/theme.dart';

class RegisterRouter extends AppRouter {
  void toMenuView() => Get.offAllNamed(Routes.MENU);
  void toLoginView() => Get.offNamed(Routes.LOGIN);
}
