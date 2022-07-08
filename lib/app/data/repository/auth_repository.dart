import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/request/auth/login_request.dart';
import 'package:food/app/data/models/request/auth/refresh_token_request.dart';
import 'package:food/app/data/models/request/auth/register_request.dart';
import 'package:food/app/data/models/response/auth.dart';
import 'package:food/app/data/provider/local/local.dart';

mixin AuthRepository {
  Future<ResultData<Auth>> fetchLogin({required LoginRequest request});
  Future<ResultData<Auth>> fetchRegister({required RegisterRequest request});
  Future<ResultData<Auth>> fetchRefreshToken({required RefreshTokenRequest request});
  Auth? getLocal();
  Future<void> addLocal({required Auth data});
  Future<void> deleteLocal();
}

class AuthRepositoryImpl with AuthRepository {

  AuthRepositoryImpl({required ApiService apiService, required MapDataSource<Auth> authLocal})
      : _apiService = apiService,
        _authLocal = authLocal;

  final ApiService _apiService;
  final MapDataSource<Auth> _authLocal;

  /////////////////////////////////////////////////////////////////////////////////////////////
  /// [Remote] ///
  /////////////////////////////////////////////////////////////////////////////////////////////
  @override
  Future<ResultData<Auth>> fetchLogin({required LoginRequest request}) {
    return _apiService.requestData<Auth>(baseRequest: request);
  }

  @override
  Future<ResultData<Auth>> fetchRefreshToken({required RefreshTokenRequest request}) {
    return _apiService.requestData<Auth>(baseRequest: request);
  }

  @override
  Future<ResultData<Auth>> fetchRegister({required RegisterRequest request}) {
    return _apiService.requestData<Auth>(baseRequest: request);
  }

  /////////////////////////////////////////////////////////////////////////////////////////////
  /// [Local] ///
  /////////////////////////////////////////////////////////////////////////////////////////////
  @override
  Auth? getLocal() {
    return _authLocal.get();
  }

  @override
  Future<void> addLocal({required Auth data}) async {
    return await _authLocal.add(data: data);
  }

  @override
  Future<void> deleteLocal() async {
    return await _authLocal.delete();
  }
}
