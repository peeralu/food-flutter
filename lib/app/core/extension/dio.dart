import 'package:food/app/core/theme/theme.dart';

extension DioApi on Dio {
  Future<Response<T>> requestData<T>({required BaseRequest baseRequest}) {
    return request(
      baseRequest.path,
      data: baseRequest.method.isPost ? baseRequest.data : null,
      queryParameters: baseRequest.method.isGet ? baseRequest.data : null,
      options: Options(
        method: baseRequest.method.value,
        headers: baseRequest.headers,
      ),
    );
  }

  Future<Response<T>> cloneRequest<T>({required RequestOptions requestOptions}) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return await request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
