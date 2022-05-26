import 'package:food/app/core/theme/theme.dart';

class AppShadow {
  static List<BoxShadow> get ss {
    return [
      BoxShadow(
        color: AppColors.gray.withOpacity(0.5),
        blurRadius: spaceSS,
        offset: Offset(0, 0),
      ),
    ];
  }

  static List<BoxShadow> get s {
    return [
      BoxShadow(
        color: AppColors.gray.withOpacity(0.7),
        blurRadius: spaceS,
        offset: Offset(0, 0),
      ),
    ];
  }

  static List<BoxShadow> get m {
    return [
      BoxShadow(
        color: AppColors.gray.withOpacity(0.9),
        blurRadius: spaceM,
        offset: Offset(0, 0),
      ),
    ];
  }
}
