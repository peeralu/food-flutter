import 'package:food/app/core/theme/theme.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      init: LanguageController(),
      builder: (controller) {
        return GestureDetector(
          onTap: controller.onToggle,
          child: Padding(
            padding: EdgeInsets.all(spaceS),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.yellow),
                borderRadius: AppBorderRadius.xl,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!controller.isTH.value) horizontalSpaceSS,
                  Container(
                    width: getWidth(LanguageService.th),
                    decoration: getBoxDecoration(LanguageService.th),
                    padding: EdgeInsets.symmetric(vertical: spaceSS + spaceSSS),
                    child: LocaleKeys.button_switch_language_th.tr.s1
                        .height(1)
                        .alignCenter
                        .color(getColor(LanguageService.th)),
                  ),
                  Container(
                    width: getWidth(LanguageService.en),
                    decoration: getBoxDecoration(LanguageService.en),
                    padding: EdgeInsets.symmetric(vertical: spaceSS + spaceSSS),
                    child: LocaleKeys.button_switch_language_en.tr.s1
                        .height(1)
                        .alignCenter
                        .color(getColor(LanguageService.en)),
                  ),
                  if (controller.isTH.value) horizontalSpaceSS,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  BoxDecoration? getBoxDecoration(Locale locale) {
    if (locale == LanguageService.current) {
      return BoxDecoration(
        color: AppColors.yellow,
        borderRadius: AppBorderRadius.xl,
      );
    }
    return null;
  }

  Color getColor(Locale locale) {
    if (locale == LanguageService.current) {
      return AppColors.white;
    }
    return AppColors.black;
  }

  double getWidth(Locale locale) {
    if (locale == LanguageService.current) {
      return spaceXXL;
    }
    return spaceXXL - spaceS;
  }
}

class LanguageController extends GetxController {
  final isTH = LanguageService.isTh.obs;

  onToggle() {
    LanguageService.swapLanguage();
    isTH.value = LanguageService.isTh;
  }
}
