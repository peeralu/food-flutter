import 'dart:io';

import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/response/base_response.dart';

import 'interceptor/log_interceptor.dart';
import 'interceptor/token_interceptor.dart';

class ApiService {
  static Dio createDio() {
    Dio dio = Dio();
    dio.options.baseUrl = BASE_URL_API;
    dio.interceptors.add(LogInterceptors());
    dio.interceptors.add(TokenInterceptors(dio: dio));
    return dio;
  }

  ApiService({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<ResultData<T>> requestData<T>({required BaseRequest baseRequest}) async {
    try {
      if (await _isConnection()) {
        throw ApiServiceFailure(message: "server not response");
      }

      final response = await _dio.requestData(baseRequest: baseRequest);

      if (response.isNotOK) {
        throw ApiServiceFailure(message: "data not found");
      }

      return _success<T>(baseRequest: baseRequest, response: response);
    } on DioError catch (error) {
      return _error<T>(baseRequest: baseRequest, error: error);
    }
  }

  ResultData<T> _success<T>({required BaseRequest baseRequest, required Response response}) {
    final baseResponse = BaseResponse.fromJson(response.data, baseRequest.defaultDecoder);
    return ResultData.success<T>(baseResponse.results);
  }

  ResultData<T> _error<T>({required BaseRequest baseRequest, required DioError error}) {
    if (error.response?.hasData ?? true) {
      return ResultData.failure(ApiServiceFailure(
        message: error.response?.statusMessage ?? "",
      ));
    }

    final baseResponse = BaseResponse.fromJson(error.response!.data, baseRequest.defaultDecoder);
    return ResultData.failure(ApiServiceFailure(
      message: baseResponse.errors ?? "",
    ));
  }

  Future<bool> _isConnection() async {
    try {
      final response = await InternetAddress.lookup(BASE_URL_API);
      return response.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
