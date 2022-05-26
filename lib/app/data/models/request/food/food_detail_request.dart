import 'package:food/app/data/models/request/base_request.dart';
import 'package:food/app/data/models/response/category.dart';

class FoodDetailRequest with BaseRequest {
  @override
  String get path => "/api/food/detail";

  @override
  MethodRequest get method => MethodRequest.post;

  @override
  dynamic get data => toJson();

  @override
  bool get isAuthorization => true;

  @override
  DefaultDecoder get defaultDecoder => _defaultDecoder;

  MenuDetail _defaultDecoder(json) {
    return MenuDetail.fromJson(json);
  }

  int? foodId;

  FoodDetailRequest({this.foodId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foodId'] = this.foodId;
    return data;
  }
}
