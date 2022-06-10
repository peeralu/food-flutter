import 'package:get/get.dart';

import 'sliver_list_controller.dart';

class SliverListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SliverListController>(
      () => SliverListController(),
    );
  }
}
