import 'package:food/app/modules/menu/menu_reouter.dart';
import 'package:get/get.dart';

import 'bloc/category_cubit.dart';
import 'bloc/food_cubit.dart';
import 'menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FoodCubit());
    Get.put(CategoryCubit());

    Get.lazyPut<MenuRouter>(() => MenuRouter());
    Get.lazyPut<MenuController>(() => MenuController());
  }
}
