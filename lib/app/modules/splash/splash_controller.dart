import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/repository/auth_repository.dart';

import 'splash_router.dart';

class SplashController extends AppController<SplashRouter> {

  SplashController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(Duration(seconds: 2));
    if (_authRepository.getLocal() != null) {
      router.toMenuView();
    } else {
      router.toWelcomeView();
    }
  }

  @override
  void onClose() {}
}
