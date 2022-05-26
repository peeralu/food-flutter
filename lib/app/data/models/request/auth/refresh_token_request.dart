import 'package:food/app/data/models/request/base_request.dart';
import 'package:food/app/data/models/response/auth.dart';

class RefreshTokenRequest with BaseRequest {
  @override
  MethodRequest get method => MethodRequest.post;

  @override
  String get path => "/api/auth/refreshtoken";

  @override
  dynamic get data => toJson();

  @override
  bool get isAuthorization => true;

  @override
  DefaultDecoder get defaultDecoder => _defaultDecoder;

  Auth _defaultDecoder(dynamic json) {
    return Auth.fromJson(formJsonMap(json));
  }

  String? refreshToken;

  RefreshTokenRequest({this.refreshToken});

  RefreshTokenRequest.fromJson(Map<String, dynamic> json) {
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}
