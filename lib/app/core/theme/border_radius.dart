import 'package:food/app/core/theme/theme.dart';

class AppBorderRadius {
  static BorderRadius custom(double radius) {
    return BorderRadius.circular(radius);
  }

  static BorderRadius get ss {
    return BorderRadius.circular(spaceSS);
  }

  static BorderRadius get s {
    return BorderRadius.circular(spaceS);
  }

  static BorderRadius get m {
    return BorderRadius.circular(spaceM);
  }

  static BorderRadius get l {
    return BorderRadius.circular(spaceL);
  }

  static BorderRadius get xl {
    return BorderRadius.circular(spaceXL);
  }
}
