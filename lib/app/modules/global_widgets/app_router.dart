import 'package:get/get.dart';

class AppRouter<Router> {
  void toBack<T>({T? result, bool closeOverlays = false, bool canPop = true, int? id}) async {
    Get.back(result: result, closeOverlays: closeOverlays, canPop: canPop, id: id);
  }
}
