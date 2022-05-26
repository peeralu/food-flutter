import 'package:food/app/core/theme/theme.dart';

class WelcomeRouter extends AppRouter {
  void toLogin() => Get.toNamed(Routes.LOGIN);
  void toRegister() => Get.toNamed(Routes.REGISTER);
}
