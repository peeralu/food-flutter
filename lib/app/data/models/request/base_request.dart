import 'dart:io';

typedef DefaultDecoder<T> = T Function(dynamic json);

abstract class BaseRequest<T> {
  String get path;
  MethodRequest get method;
  Map<String, dynamic> get headers => _headers;
  dynamic get data;
  bool get isAuthorization;
  DefaultDecoder get defaultDecoder;

  Map<String, dynamic> get _headers {
    var headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: 'application/json',
    };

    if (isAuthorization) {
      headers.addAll({
        HttpHeadersCustom.xAccessToken: "",
      });
    }

    return headers;
  }

  String formJsonString(dynamic json) {
    if (json is String) return json;
    return "";
  }

  int formJsonInt(dynamic json) {
    if (json is int) return json;
    return 0;
  }

  double formJsonDouble(dynamic json) {
    if (json is double) return json;
    return 0.0;
  }

  List<dynamic> formJsonList(dynamic json) {
    if (json is List) return json;
    return [];
  }

  Map<String, dynamic> formJsonMap(dynamic json) {
    if (json is Map<String, dynamic>) return json;
    return {};
  }
}

enum MethodRequest { get, post }

extension MethodRequestName on MethodRequest {
  String get value {
    switch (this) {
      case MethodRequest.post:
        return "POST";
      default:
        return "GET";
    }
  }

  bool get isGet {
    return this == MethodRequest.get;
  }

  bool get isPost {
    return this == MethodRequest.post;
  }
}

extension HttpHeadersCustom on HttpHeaders {
  static const xAccessToken = "x-access-token";
}
