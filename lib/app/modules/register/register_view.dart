import 'package:food/app/core/theme/theme.dart';

import 'register_controller.dart';

class RegisterView extends GetView<RegisterController> {
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
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: spaceXL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LocaleKeys.pages_register_title.tr.header,
                LocaleKeys.pages_register_sub_title.tr.subHeader,
                verticalSpaceXXL,
                _formBuilder(),
                verticalSpaceXL,
                AppButtonWidget.yellow(
                  title: LocaleKeys.button_login.tr,
                  isExpanded: true,
                  onPressed: controller.onRegister,
                ),
                verticalSpaceXL,
                _toLoginView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _formBuilder() {
    return FormBuilder(
      key: controller.formBuilder,
      child: Column(
        children: [
          InputFieldWidget(
            name: LocaleKeys.form_name,
            placeholder: LocaleKeys.form_name.tr,
            keyboardType: TextInputType.text,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(Get.context!),
            ]),
          ),
          verticalSpaceM,
          InputFieldWidget(
            name: LocaleKeys.form_email,
            placeholder: LocaleKeys.form_email.tr,
            keyboardType: TextInputType.emailAddress,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(Get.context!),
              FormBuilderValidators.email(Get.context!),
            ]),
          ),
          verticalSpaceM,
          InputFieldWidget(
            name: LocaleKeys.form_mobile,
            placeholder: LocaleKeys.form_mobile.tr,
            keyboardType: TextInputType.phone,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(Get.context!),
            ]),
          ),
          verticalSpaceM,
          InputFieldWidget(
            name: LocaleKeys.form_address,
            placeholder: LocaleKeys.form_address.tr,
            keyboardType: TextInputType.streetAddress,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(Get.context!),
            ]),
          ),
          verticalSpaceM,
          InputFieldWidget(
            name: LocaleKeys.form_password,
            placeholder: LocaleKeys.form_password.tr,
            obscureText: true,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(Get.context!),
              FormBuilderValidators.minLength(Get.context!, 4),
              FormBuilderValidators.maxLength(Get.context!, 20),
            ]),
          ),
          verticalSpaceM,
          InputFieldWidget(
            name: LocaleKeys.form_confirm_password,
            placeholder: LocaleKeys.form_confirm_password.tr,
            obscureText: true,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(Get.context!),
              FormBuilderValidators.minLength(Get.context!, 4),
              FormBuilderValidators.maxLength(Get.context!, 20),
              (formConfirmPassword) {
                final formPassword = controller.formBuilder.currentState!.value[LocaleKeys.form_password];
                if (formPassword != null && formPassword == formConfirmPassword) return null;
                return "Confirm password not match";
              },
            ]),
          ),
        ],
      ),
    );
  }

  Widget _toLoginView() {
    return Container(
      margin: EdgeInsets.only(bottom: spaceXL),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LocaleKeys.pages_register_to_login.tr.b1.color(AppColors.darkGrey),
          horizontalSpaceS,
          GestureDetector(
            onTap: controller.router.toLoginView,
            child: LocaleKeys.pages_login_title.tr.b1.color(AppColors.yellow),
          ),
        ],
      ),
    );
  }
}
