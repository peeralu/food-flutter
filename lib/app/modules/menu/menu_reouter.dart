import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/response/category.dart';

class MenuRouter extends AppRouter {
  void toDetailView(Menu menu) => Get.toNamed(Routes.DETAIL, arguments: menu);
  void toWelcomeView() => Get.offAllNamed(Routes.WELCOME);
}
