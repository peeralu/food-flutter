import 'package:food/app/core/theme/dialog/custom_dialog.dart';
import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/response/category.dart';
import 'package:food/app/data/repository/auth_repository.dart';
import 'package:food/app/modules/menu/bloc/food_cubit.dart';

import 'bloc/category_cubit.dart';
import 'menu_reouter.dart';

class MenuController extends AppController<MenuRouter> {

  MenuController({
    required AuthRepository authRepository,
    required CategoryCubit categoryCubit,
    required FoodCubit foodCubit,
  })  : _authRepository = authRepository,
        _categoryCubit = categoryCubit,
        _foodCubit = foodCubit;

  final AuthRepository _authRepository;
  final CategoryCubit _categoryCubit;
  final FoodCubit _foodCubit;

  final formKey = GlobalKey<FormBuilderState>();
  final categoryName = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchCategory();
  }

  @override
  void onClose() {}

  fetchCategory() async {
    await _categoryCubit.fetchCategory();
    onSelect(index: 0);
  }

  onSearch(String? search) {
    if (search == null) {
      formKey.currentState?.reset();
      KeyboardService.hide();
    }
    if (search != null && search.isNotEmpty) {
      _categoryCubit.hidden(hidden: true);
      final menus = _categoryCubit.fetchSearch(search: search);
      _foodCubit.updateData(menus: menus);
    } else {
      _categoryCubit.hidden(hidden: false);
      final menus = _categoryCubit.fetchMenus();
      _foodCubit.updateData(menus: menus);
    }
  }

  onSelect({required int index}) {
    _categoryCubit.updateIndex(current: index);
    final menus = _categoryCubit.fetchMenus();
    _foodCubit.updateData(menus: menus);
  }

  void onDetail({required Menu menu}) {
    router.toDetailView(menu);
  }

  onLogout() async {
    CustomDialog.logout(
      onConfirm: () async {
        await _authRepository.deleteLocal();
        router.toWelcomeView();
      },
    );
  }
}
