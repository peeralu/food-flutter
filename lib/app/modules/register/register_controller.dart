import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/request/auth/register_request.dart';
import 'package:food/app/data/models/response/auth.dart';
import 'package:food/app/data/repository/auth_repository.dart';
import 'package:food/app/modules/register/register_router.dart';

class RegisterController extends AppController<RegisterRouter> {

  RegisterController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  var formBuilder = GlobalKey<FormBuilderState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onRegister() {
    if (formBuilder.currentState!.saveAndValidate()) {
      KeyboardService.hide();
      final values = formBuilder.currentState!.value;
      final formName = values[LocaleKeys.form_name];
      final formEmail = values[LocaleKeys.form_email];
      final formMobile = values[LocaleKeys.form_mobile];
      final formAddress = values[LocaleKeys.form_address];
      final formPassword = values[LocaleKeys.form_password];
      fetchRegister(
        registerRequest: RegisterRequest(
          name: formName,
          email: formEmail,
          mobile: formMobile,
          address: formAddress,
          password: formPassword,
        ),
      );
    }
  }

  /////////////////////////////////////////////
  /// [ApiService] :: [AuthService.fetchRegister]
  /////////////////////////////////////////////
  fetchRegister({required RegisterRequest registerRequest}) async {
    Loading.show();
    final response = await _authRepository.fetchRegister(request: registerRequest);
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
