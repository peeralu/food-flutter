import 'package:food/app/data/models/request/base_request.dart';

class FoodFavoriteRequest with BaseRequest {
  @override
  String get path => "/api/food/favorite";

  @override
  MethodRequest get method => MethodRequest.post;

  @override
  dynamic get data => toJson();

  @override
  bool get isAuthorization => true;

  @override
  DefaultDecoder get defaultDecoder => _defaultDecoder;

  String _defaultDecoder(json) {
    return formJsonString(json);
  }

  int? foodId;

  FoodFavoriteRequest({this.foodId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foodId'] = this.foodId;
    return data;
  }
}
