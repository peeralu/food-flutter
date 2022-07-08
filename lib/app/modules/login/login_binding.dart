import 'package:food/app/data/repository/auth_repository.dart';
import 'package:food/app/modules/login/login_router.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    final authRepository = Get.find<AuthRepository>();
    Get.lazyPut<LoginRouter>(() => LoginRouter());
    Get.lazyPut<LoginController>(
          () => LoginController(
        authRepository: authRepository,
      ),
    );
  }
}
