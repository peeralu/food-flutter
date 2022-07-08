import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/enum/log.dart';

class LogInterceptors extends Interceptor {
  final LogService logService;

  LogInterceptors({required this.logService});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final message = "${options.uri.path}\n${options.data}";
    logService.v(message, type: LogFilerType.backoffice);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final message = "${response.realUri.path} ${response.statusCode} \n ${response.data}";
    logService.i(message, type: LogFilerType.backoffice);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final message = "${err.requestOptions.uri.path} ${err.response?.statusCode}\n${err.response?.data}";
    logService.e(message, type: LogFilerType.backoffice);
    super.onError(err, handler);
  }
}
