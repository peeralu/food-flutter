import 'package:food/app/core/theme/dialog/custom_dialog.dart';
import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/response/category.dart';
import 'package:food/app/data/repository/auth_repository.dart';
import 'package:food/app/modules/menu/bloc/food_cubit.dart';

import 'bloc/category_cubit.dart';
import 'menu_reouter.dart';

class MenuController extends AppController<MenuRouter> {
  final _authRepository = AuthRepository.instead;
  final formKey = GlobalKey<FormBuilderState>();
  final categoryName = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchCatefory();
  }

  @override
  void onClose() {}

  fetchCatefory() async {
    await CategoryCubit.instead.fetchCatefory();
    onSelect(index: 0);
  }

  onSearch(String? search) {
    if (search == null) {
      formKey.currentState?.reset();
      KeyboardService.hide();
    }
    if (search != null && search.isNotEmpty) {
      CategoryCubit.instead.hidden(hidden: true);
      final menus = CategoryCubit.instead.fetchSearch(search: search);
      FoodCubit.instead.updateData(menus: menus);
    } else {
      CategoryCubit.instead.hidden(hidden: false);
      final menus = CategoryCubit.instead.fetchMenus();
      FoodCubit.instead.updateData(menus: menus);
    }
  }

  onSelect({required int index}) {
    CategoryCubit.instead.updateIndex(current: index);
    final menus = CategoryCubit.instead.fetchMenus();
    FoodCubit.instead.updateData(menus: menus);
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
