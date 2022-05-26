import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/modules/global_widgets/app_binding.dart';

void main() async {
  await AppBinding.initial();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 600),
      locale: LanguageService.th,
      translationsKeys: AppTranslation.translations,
      theme: ThemeData(
        fontFamily: "Kanit",
        primaryColor: AppColors.yellow,
        primarySwatch: AppColors.materialYellow,
      ),
      builder: EasyLoading.init(),
    ),
  );
}
