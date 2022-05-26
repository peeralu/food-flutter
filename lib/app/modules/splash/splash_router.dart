import 'package:food/app/core/theme/theme.dart';

class SplashRouter extends AppRouter {
  void toWelcomeView() => Get.offNamed(Routes.WELCOME);
  void toMenuView() => Get.offNamed(Routes.MENU);
  void toLoginView() => Get.offNamed(Routes.LOGIN);
}
