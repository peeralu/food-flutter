import 'package:food/app/modules/register/register_router.dart';
import 'package:get/get.dart';

import 'register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterRouter>(() => RegisterRouter());
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
