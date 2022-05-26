import 'package:food/app/modules/login/login_router.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRouter>(() => LoginRouter());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
