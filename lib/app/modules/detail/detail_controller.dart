import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/request/food/food_detail_request.dart';
import 'package:food/app/data/models/request/food/food_favorite_request.dart';
import 'package:food/app/data/models/response/category.dart';
import 'package:food/app/data/repository/food_repository.dart';
import 'package:food/app/modules/detail/detail_router.dart';

class DetailController extends AppController<DetailRouter> {
  final FoodRepository _foodRepository;

  final detail = MenuDetail().obs;
  final menu = Menu().obs;

  DetailController({
    required FoodRepository foodRepository,
  }) : _foodRepository = foodRepository;

  @override
  void onInit() {
    super.onInit();

    final _menu = Get.arguments;
    if (_menu != null && _menu is Menu) {
      menu.value = _menu;
      fetchDetail(
        request: FoodDetailRequest(foodId: _menu.id),
      );
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onFavorite() {
    fetchFavorite(request: FoodFavoriteRequest(foodId: menu.value.id));
  }

  /////////////////////////////////////////////
  /// [ApiService] :: [FoodService.fetchDetail]
  /////////////////////////////////////////////
  fetchDetail({required FoodDetailRequest request}) async {
    Loading.show();
    final response = await _foodRepository.fetchDetail(request: request);
    Loading.dismiss();

    if (response.isSuccessAndHasData) {
      detail.value = response.data ?? MenuDetail();
    } else {
      dialogFailure(failure: response.error);
    }
  }

  /////////////////////////////////////////////
  /// [ApiService] :: [FoodService.fetchDetail]
  /////////////////////////////////////////////
  fetchFavorite({required FoodFavoriteRequest request}) async {
    Loading.show();
    final response = await _foodRepository.fetchFavorite(request: request);
    Loading.dismiss();

    if (response.isSuccessAndHasData) {
      detail.value.isFavorite = !detail.value.isFavorite!;
      detail.refresh();
    } else {
      dialogFailure(failure: response.error);
    }
  }
}
