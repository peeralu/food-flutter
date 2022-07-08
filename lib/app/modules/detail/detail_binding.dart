import 'package:food/app/data/repository/food_repository.dart';
import 'package:food/app/modules/detail/detail_router.dart';
import 'package:get/get.dart';

import 'detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    final foodRepository = Get.find<FoodRepository>();
    Get.lazyPut<DetailRouter>(() => DetailRouter());
    Get.lazyPut<DetailController>(
          () => DetailController(
        foodRepository: foodRepository,
      ),
    );
  }
}
