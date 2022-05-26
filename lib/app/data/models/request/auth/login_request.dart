import 'package:food/app/data/models/request/base_request.dart';
import 'package:food/app/data/models/response/auth.dart';

class LoginRequest with BaseRequest {
  @override
  MethodRequest get method => MethodRequest.post;

  @override
  String get path => "/api/auth/login";

  @override
  dynamic get data => toJson();

  @override
  bool get isAuthorization => false;

  @override
  DefaultDecoder get defaultDecoder => _defaultDecoder;

  Auth _defaultDecoder(dynamic json) {
    return Auth.fromJson(formJsonMap(json));
  }

  String? email;
  String? password;

  LoginRequest({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
