import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/request/auth/refresh_token_request.dart';
import 'package:food/app/data/repository/auth_repository.dart';

class TokenInterceptors extends Interceptor {
  TokenInterceptors({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers.containsKey(HttpHeadersCustom.xAccessToken)) {
      options.headers.remove(HttpHeadersCustom.xAccessToken);
      final storage = Get.find<AuthRepository>().getLocal();
      options.headers.addAll({
        HttpHeadersCustom.xAccessToken: storage?.accessToken ?? "",
      });
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final auth = Get.find<AuthRepository>().getLocal();
      final response = await Get.find<AuthRepository>().fetchRefreshToken(
        request: RefreshTokenRequest(refreshToken: auth?.refreshToken ?? ""),
      );

      if (response.isSuccessAndHasData) {
        Get.find<AuthRepository>().addLocal(data: response.data!);
        final cloneRequest = await _dio.cloneRequest(requestOptions: err.requestOptions);
        return handler.resolve(cloneRequest);
      }
    } else if (err.response?.statusCode == 403) {
      Get.find<AuthRepository>().deleteLocal();
    }
    super.onError(err, handler);
  }
}
