import 'package:food/app/core/theme/theme.dart';

class LoginRouter extends AppRouter {
  void toMenuView() => Get.offAllNamed(Routes.MENU);
  void toRegisterView() => Get.offNamed(Routes.REGISTER);
}
