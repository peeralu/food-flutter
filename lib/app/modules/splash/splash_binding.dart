import 'package:food/app/data/repository/auth_repository.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';
import 'splash_router.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    final authRepository = Get.find<AuthRepository>();
    Get.put<SplashRouter>(SplashRouter());
    Get.put<SplashController>(
      SplashController(
        authRepository: authRepository,
      ),
    );
  }
}
