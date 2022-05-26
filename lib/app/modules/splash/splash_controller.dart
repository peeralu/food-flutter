import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/repository/auth_repository.dart';

import 'splash_router.dart';

class SplashController extends AppController<SplashRouter> {
  final _authRepository = AuthRepository.instead;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(Duration(seconds: 2));
    if (_authRepository.get() != null) {
      router.toMenuView();
    } else {
      router.toWelcomeView();
    }
  }

  @override
  void onClose() {}
}
