import 'package:food/app/data/repository/auth_repository.dart';
import 'package:food/app/data/repository/food_repository.dart';
import 'package:food/app/modules/menu/menu_reouter.dart';
import 'package:get/get.dart';

import 'bloc/category_cubit.dart';
import 'bloc/food_cubit.dart';
import 'menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    final foodRepository = Get.find<FoodRepository>();
    Get.put(FoodCubit());
    Get.put(CategoryCubit(foodRepository));

    final authRepository = Get.find<AuthRepository>();
    final categoryCubit = Get.find<CategoryCubit>();
    final foodCubit = Get.find<FoodCubit>();
    Get.lazyPut<MenuRouter>(() => MenuRouter());
    Get.lazyPut<MenuController>(
          () => MenuController(
        authRepository: authRepository,
        categoryCubit: categoryCubit,
        foodCubit: foodCubit,
      ),
    );
  }
}
