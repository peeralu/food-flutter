import 'package:get/get.dart';

import 'testest_controller.dart';

class TestestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestestController>(
      () => TestestController(),
    );
  }
}
