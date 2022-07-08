import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/request/auth/login_request.dart';
import 'package:food/app/data/repository/auth_repository.dart';

import 'login_router.dart';

class LoginController extends AppController<LoginRouter> {

  LoginController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  var formBuilder = GlobalKey<FormBuilderState>();

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onLogin() {
    if (formBuilder.currentState!.saveAndValidate()) {
      KeyboardService.hide();
      final values = formBuilder.currentState!.value;
      final formEmail = values[LocaleKeys.form_email];
      final formPassword = values[LocaleKeys.form_password];
      fetchLogin(
        request: LoginRequest(
          email: formEmail,
          password: formPassword,
        ),
      );
    }
  }

  /////////////////////////////////////////////
  /// [ApiService] :: [AuthRepository.fetchLogin]
  /////////////////////////////////////////////
  fetchLogin({required LoginRequest request}) async {
    Loading.show();
    final response = await _authRepository.fetchLogin(request: request);
    Loading.dismiss();

    if (response.isSuccessAndHasData) {
      _authRepository.addLocal(data: response.data!);
      formBuilder.currentState!.reset();
      router.toMenuView();
    } else {
      dialogFailure(failure: response.error);
    }
  }
}
