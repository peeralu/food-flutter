import 'package:get/get.dart';

import 'splash_controller.dart';
import 'splash_router.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashRouter>(SplashRouter());
    Get.put<SplashController>(SplashController());
  }
}
