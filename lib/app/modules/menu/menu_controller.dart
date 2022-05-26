import 'package:food/app/core/theme/dialog/custom_dialog.dart';
import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/response/category.dart';
import 'package:food/app/data/repository/auth_repository.dart';
import 'package:food/app/data/repository/food_repository.dart';

import 'menu_reouter.dart';

class MenuController extends AppController<MenuRouter> with StateMixin<List<Category>> {
  final _authRepository = AuthRepository.instead;
  final _foodRepository = FoodRepository.instead;

  var currentCategory = 0;
  final categories = <Category>[].obs;
  final menu = <Menu>[].obs;
  final filterMenu = <Menu>[].obs;
  final titleCategory = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchCatefory();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  fetchCatefory() async {
    change(null, status: RxStatus.loading());
    final response = await _foodRepository.fetchList();

    if (response.isSuccessAndHasData) {
      categories.value = response.data ?? [];
      titleCategory.value = categories.first.name ?? "";
      menu.value = categories.first.menu ?? [];
      change(categories, status: RxStatus.success());
    } else {
      await _authRepository.delete();
      router.toWelcomeView();
      change(null, status: RxStatus.error("adsadsadsa"));
    }
  }

  onSelect({required int index}) {
    currentCategory = index;
    final category = categories[index];
    titleCategory.value = category.name ?? "";
    menu.value = category.menu ?? [];
    change(categories, status: RxStatus.success());
  }

  void onDetail({required Menu menu}) {
    router.toDetailView(menu);
  }

  onLogout() async {
    CustomDialog.logout(
      onConfirm: () async {
        await _authRepository.delete();
        router.toWelcomeView();
      },
    );
  }
}
