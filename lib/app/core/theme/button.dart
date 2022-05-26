import 'package:food/app/core/theme/theme.dart';

class AppButtonWidget extends StatelessWidget {
  final String title;
  final Color? color;
  final bool isEnable;
  final bool isExpanded;
  final VoidCallback? onPressed;

  AppButtonWidget({
    required this.title,
    this.color,
    this.isEnable = true,
    this.isExpanded = false,
    required this.onPressed,
  });

  AppButtonWidget.white({
    required this.title,
    this.isEnable = true,
    this.isExpanded = false,
    required this.onPressed,
  }) : color = AppColors.white;

  AppButtonWidget.yellow({
    required this.title,
    this.isEnable = true,
    this.isExpanded = false,
    required this.onPressed,
  }) : color = AppColors.yellow;

  @override
  Widget build(BuildContext context) {
    if (isExpanded) {
      return Container(
        width: double.infinity,
        child: _elevatedButton(),
      );
    } else {
      return _elevatedButton();
    }
  }

  Widget _elevatedButton() {
    return ElevatedButton(
      child: title.btnM.color(isEnable ? AppColors.black : AppColors.black54),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(1.0),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
          horizontal: spaceL,
          vertical: spaceS + spaceSS,
        )),
        overlayColor: overlayColor(),
        backgroundColor: MaterialStateProperty.all<Color>(color ?? AppColors.yellow),
        shape: shape(),
      ),
      onPressed: isEnable ? onPressed : null,
    );
  }

  MaterialStateProperty<Color?>? overlayColor() {
    return MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return AppColors.lightGray;
        }
        return color ?? AppColors.white;
      },
    );
  }

  MaterialStateProperty<Color?>? backgroundColor() {
    return MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return AppColors.lightGray;
        } else if (states.contains(MaterialState.pressed)) {
          return (color ?? AppColors.white).withOpacity(0.5);
        }
        return color ?? AppColors.white;
      },
    );
  }

  MaterialStateProperty<RoundedRectangleBorder?>? shape() {
    return MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spaceXXXXL),
            side: BorderSide(width: 1.5, color: AppColors.lightGray),
          );
        }
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spaceXXXXL),
          side: BorderSide(width: 1.5, color: AppColors.yellow),
        );
      },
    );
  }
}
