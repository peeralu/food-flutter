import 'package:food/app/data/models/request/base_request.dart';
import 'package:food/app/data/models/response/auth.dart';

class RegisterRequest with BaseRequest {
  @override
  MethodRequest get method => MethodRequest.post;

  @override
  String get path => "/api/auth/register";

  @override
  dynamic get data => toJson();

  @override
  bool get isAuthorization => false;

  @override
  DefaultDecoder get defaultDecoder => _defaultDecoder;

  Auth _defaultDecoder(dynamic json) {
    return Auth.fromJson(formJsonMap(json));
  }

  String? name;
  String? email;
  String? mobile;
  String? address;
  String? password;

  RegisterRequest({
    this.email,
    this.name,
    this.mobile,
    this.address,
    this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['password'] = this.password;
    return data;
  }
}
