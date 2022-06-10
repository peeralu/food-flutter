import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/request/food/food_detail_request.dart';
import 'package:food/app/data/models/request/food/food_favorite_request.dart';
import 'package:food/app/data/models/request/food/food_list_request.dart';
import 'package:food/app/data/models/response/category.dart';

mixin FoodRemote {
  Future<ResultData<ListCategory>> fetchList();
  Future<ResultData<MenuDetail>> fetchDetail({required FoodDetailRequest request});
}

class FoodRepository with FoodRemote {
  static FoodRepository get instead => Get.find<FoodRepository>();

  FoodRepository({
    required ApiService apiService,
    // required Box<Category> database,
  }) : _apiService = apiService;
  // _database = database;

  final ApiService _apiService;
  // final Box<Category> _database;

  /////////////////////////////////////////////////////////////////////////////////////////////
  /// [Remote] ///
  /////////////////////////////////////////////////////////////////////////////////////////////
  @override
  Future<ResultData<ListCategory>> fetchList() {
    return _apiService.requestData(baseRequest: FoodListRequest());
  }

  @override
  Future<ResultData<MenuDetail>> fetchDetail({required FoodDetailRequest request}) {
    return _apiService.requestData(baseRequest: request);
  }

  @override
  Future<ResultData<String>> fetchFavorite({required FoodFavoriteRequest request}) {
    return _apiService.requestData(baseRequest: request);
  }
}
