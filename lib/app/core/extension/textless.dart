import 'package:food/app/core/theme/theme.dart';

extension TextLessTitle on String {
  ThemedText get header => ThemedText(
        data: this,
        style: (t) => t.headline4!.copyWith(
          color: AppColors.black54,
          fontWeight: FontWeight.w400,
        ),
      );
  ThemedText get subHeader => ThemedText(
        data: this,
        style: (t) => t.subtitle1!.copyWith(
          color: AppColors.darkGrey,
        ),
      );
}

extension TextLessButton on String {
  ThemedText get btnM => ThemedText(
        data: this,
        style: (t) => t.subtitle1!.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontSize: 18,
          letterSpacing: 0.2,
        ),
      );
}

extension TextLessMenu on String {
  ThemedText get titleMenu => ThemedText(
        data: this,
        style: (t) => t.headline6!.copyWith(
          color: AppColors.black87,
          fontSize: 24,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.2,
        ),
      );

  ThemedText get titleCategory => ThemedText(
        data: this,
        style: (t) => t.subtitle1!.copyWith(
          color: AppColors.black87,
          fontSize: 30,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      );
}

extension TextLessDetail on String {
  ThemedText get titleFood => ThemedText(
        data: this,
        style: (t) => t.headline6!.copyWith(
          color: AppColors.black87,
          fontSize: 24,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.2,
        ),
      );

  ThemedText get titleDescription => ThemedText(
        data: this,
        style: (t) => t.subtitle1!.copyWith(
          color: AppColors.black87,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.2,
        ),
      );
  ThemedText get detailDescription => ThemedText(
        data: this,
        style: (t) => t.subtitle1!.copyWith(
          color: AppColors.gray,
          fontSize: 16,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.2,
        ),
      );
}
