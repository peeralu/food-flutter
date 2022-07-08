import 'package:food/app/data/repository/auth_repository.dart';
import 'package:food/app/modules/register/register_router.dart';
import 'package:get/get.dart';

import 'register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    final authRepository = Get.find<AuthRepository>();
    Get.lazyPut<RegisterRouter>(() => RegisterRouter());
    Get.lazyPut<RegisterController>(
          () => RegisterController(
        authRepository: authRepository,
      ),
    );
  }
}
