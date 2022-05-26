import 'package:food/app/core/theme/theme.dart';

import 'welcome_controller.dart';
import 'widget/language_widget.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.yellow,
                image: DecorationImage(
                  image: AssetImage("assets/images/bg_welcome.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(spaceXL),
                  bottomRight: Radius.circular(spaceXL),
                ),
                boxShadow: AppShadow.m,
              ),
              child: SafeArea(
                child: Center(
                  child: Hero(
                    tag: "logo",
                    child: SvgPicture.asset("assets/images/logo.svg"),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: spaceXL),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButtonWidget.yellow(
                      title: LocaleKeys.button_login.tr,
                      isExpanded: true,
                      onPressed: controller.router.toLogin,
                    ),
                    verticalSpaceM,
                    AppButtonWidget.white(
                      title: LocaleKeys.button_create_account.tr,
                      isExpanded: true,
                      onPressed: controller.router.toRegister,
                    ),
                    verticalSpaceM,
                    LanguageWidget(),
                    verticalSpaceXL,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
