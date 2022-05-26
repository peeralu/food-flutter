import 'package:get/get.dart';

import 'welcome_controller.dart';
import 'welcome_router.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WelcomeRouter>(WelcomeRouter());
    Get.put<WelcomeController>(WelcomeController());
  }
}
