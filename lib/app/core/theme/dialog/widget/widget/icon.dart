import 'package:food/app/core/theme/theme.dart';

class IconDialog extends StatelessWidget {
  final Widget child;
  IconDialog() : child = Container();

  IconDialog.success()
      : child = Icon(
          Icons.check,
          color: AppColors.green,
          size: spaceXXXXL,
        );

  IconDialog.warning()
      : child = Icon(
          AntDesign.exclamationcircleo,
          color: AppColors.yellow,
          size: spaceXXXXL,
        );

  IconDialog.error()
      : child = Icon(
          AntDesign.closecircleo,
          color: AppColors.red,
          size: spaceXXXXL,
        );

  IconDialog.custom({required IconData data, Color color = AppColors.black})
      : child = Icon(
          data,
          color: color,
          size: spaceXXXXL,
        );

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
