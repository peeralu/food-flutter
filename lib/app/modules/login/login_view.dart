import 'package:food/app/core/theme/theme.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        foregroundColor: AppColors.black,
      ),
      backgroundColor: AppColors.white,
      body: KeyboardDismissOnTap(
        child: SingleChildScrollView(
          child: _formData(),
        ),
      ),
    );
  }

  Widget _formData() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: spaceXL),
      child: FormBuilder(
        key: controller.formBuilder,
        autoFocusOnValidationFailure: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LocaleKeys.pages_login_title.tr.header,
            LocaleKeys.pages_login_sub_title.tr.subHeader,
            verticalSpaceXXL,
            InputFieldWidget(
              name: LocaleKeys.form_email,
              placeholder: LocaleKeys.form_email.tr,
              keyboardType: TextInputType.emailAddress,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(Get.context!),
                FormBuilderValidators.email(Get.context!),
              ]),
              onSubmitted: (value) {
                controller.onLogin();
              },
            ),
            verticalSpaceL,
            InputFieldWidget(
              name: LocaleKeys.form_password,
              placeholder: LocaleKeys.form_password.tr,
              obscureText: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(Get.context!),
                FormBuilderValidators.minLength(Get.context!, 4),
                FormBuilderValidators.maxLength(Get.context!, 20),
              ]),
              onSubmitted: (value) {
                controller.onLogin();
              },
            ),
            verticalSpaceXL,
            AppButtonWidget.yellow(
              title: LocaleKeys.button_login.tr,
              isEnable: true,
              isExpanded: true,
              onPressed: controller.onLogin,
            ),
            verticalSpaceXL,
            _toRegisterView(),
          ],
        ),
      ),
    );
  }

  Widget _toRegisterView() {
    return Container(
      margin: EdgeInsets.only(bottom: spaceXL),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LocaleKeys.pages_login_to_register.tr.b1.color(AppColors.darkGrey),
          horizontalSpaceS,
          GestureDetector(
            onTap: controller.router.toRegisterView,
            child: LocaleKeys.pages_register_title.tr.b1.color(AppColors.yellow),
          ),
        ],
      ),
    );
  }
}
