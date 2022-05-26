import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/request/food/food_detail_request.dart';
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

  // /////////////////////////////////////////////////////////////////////////////////////////////
  // /// [Database] ///
  // /////////////////////////////////////////////////////////////////////////////////////////////
  // @override
  // bool get isEmpty => _database.isEmpty;

  // @override
  // bool get isNotEmpty => _database.isNotEmpty;

  // @override
  // int get length => _database.length;

  // @override
  // List<dynamic> get keys => _database.keys.toList();

  // @override
  // Future<int> add({required Category value, int? index}) async {
  //   if (index == null) {
  //     return await _database.add(value);
  //   } else {
  //     await _database.putAt(index, value);
  //     return index;
  //   }
  // }

  // @override
  // Future<List<int>> addAll({required List<Category> values}) async {
  //   return (await _database.addAll(values)).toList();
  // }

  // @override
  // Future<void> delete({required int index}) async {
  //   return await _database.deleteAt(index);
  // }

  // @override
  // Future<List<Category>> getAll() async {
  //   return await _database.values.toList();
  // }

  // @override
  // Category? get({required int index}) {
  //   return _database.get(index);
  // }

  // @override
  // Future<int> update({required int index, required Category value}) async {
  //   await delete(index: index);
  //   return add(index: index, value: value);
  // }
}
