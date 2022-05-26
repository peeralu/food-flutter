import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/request/auth/login_request.dart';
import 'package:food/app/data/models/request/auth/refresh_token_request.dart';
import 'package:food/app/data/models/request/auth/register_request.dart';
import 'package:food/app/data/models/response/auth.dart';
import 'package:food/app/data/provider/local/auth_local.dart';

mixin AuthRemote {
  Future<ResultData<Auth>> fetchLogin({required LoginRequest request});
  Future<ResultData<Auth>> fetchRegister({required RegisterRequest request});
  Future<ResultData<Auth>> fetchRefetchToken({required RefreshTokenRequest request});
}

class AuthRepository with AuthRemote {
  static AuthRepository get instead => Get.find<AuthRepository>();

  AuthRepository({required ApiService apiService, required AuthLocal authLocal})
      : _apiService = apiService,
        _authLocal = authLocal;

  final ApiService _apiService;
  final AuthLocal _authLocal;

  /////////////////////////////////////////////////////////////////////////////////////////////
  /// [Remote] ///
  /////////////////////////////////////////////////////////////////////////////////////////////
  @override
  Future<ResultData<Auth>> fetchLogin({required LoginRequest request}) {
    return _apiService.requestData<Auth>(baseRequest: request);
  }

  @override
  Future<ResultData<Auth>> fetchRefetchToken({required RefreshTokenRequest request}) {
    return _apiService.requestData<Auth>(baseRequest: request);
  }

  @override
  Future<ResultData<Auth>> fetchRegister({required RegisterRequest request}) {
    return _apiService.requestData<Auth>(baseRequest: request);
  }

  /////////////////////////////////////////////////////////////////////////////////////////////
  /// [Local] ///
  /////////////////////////////////////////////////////////////////////////////////////////////
  Auth? get() {
    return _authLocal.get();
  }

  Future<void> add({required Auth data}) async {
    return await _authLocal.add(data: data);
  }

  Future<void> delete() async {
    return await _authLocal.delete();
  }
}
