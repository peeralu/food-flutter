import 'package:food/app/modules/menu/menu_reouter.dart';
import 'package:get/get.dart';

import 'menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuRouter>(() => MenuRouter());
    Get.lazyPut<MenuController>(() => MenuController());
  }
}
