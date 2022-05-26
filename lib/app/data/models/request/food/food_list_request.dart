import 'package:food/app/data/models/request/base_request.dart';
import 'package:food/app/data/models/response/category.dart';

class FoodListRequest with BaseRequest {
  @override
  String get path => "/api/food/list";

  @override
  MethodRequest get method => MethodRequest.get;

  @override
  dynamic get data => <String, dynamic>{};

  @override
  bool get isAuthorization => true;

  @override
  DefaultDecoder get defaultDecoder => _defaultDecoder;

  ListCategory _defaultDecoder(json) {
    return formJsonList(json).map((e) => Category.fromJson(e)).toList();
  }
}
