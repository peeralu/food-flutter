import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/response/category.dart';
import 'package:food/app/data/repository/food_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_cubit.freezed.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {

  List<Category> _categories = [];
  int _current = 0;
  final FoodRepository _foodRepository;

  CategoryCubit(this._foodRepository) : super(Loading());

  Future<void> fetchCategory() async {
    emit(Loading());
    final response = await _foodRepository.fetchList();
    if (response.isSuccessAndHasData) {
      updateData(categories: response.data ?? []);
    } else {
      emit(Hidden());
    }
  }

  String fetchCategoryName() {
    return _categories[_current].name ?? "";
  }

  List<Menu> fetchMenus() {
    return _categories[_current].menu ?? [];
  }

  List<Menu> fetchSearch({required String search}) {
    List<Menu> menus = [];

    if (search != "") {
      _categories.forEach((category) {
        final filter = (category.menu ?? []).where((menu) {
          return menu.name.defaultData.contains(search);
        });
        menus.addAll(filter);
      });
    } else {
      _categories.forEach((category) {
        menus.addAll((category.menu ?? []));
      });
    }

    return menus;
  }

  Future<void> hidden({required bool hidden}) async {
    if (hidden) {
      emit(Hidden());
    } else {
      emit(Loaded(current: _current, categories: _categories));
    }
  }

  Future<void> updateIndex({required int current}) async {
    _current = current;
    emit(Loaded(current: _current, categories: _categories));
  }

  Future<void> updateData({required List<Category> categories}) async {
    _categories = categories;
    if (categories.isEmpty) {
      emit(Empty());
    } else {
      emit(Loaded(current: 0, categories: categories));
    }
  }
}
