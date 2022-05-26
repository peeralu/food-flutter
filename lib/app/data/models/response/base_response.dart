class BaseResponse<T> {
  int? code;
  String? status;
  T? results;
  String? errors;

  BaseResponse({
    this.code,
    this.results,
    this.status,
    this.errors,
  });

  BaseResponse.fromJson(Map<String, dynamic> json, T Function(dynamic json) fromJsonT) {
    code = json['code'];
    status = json['status'];
    results = json['result'] != null ? fromJsonT(json['result']) : null;
    errors = json['error'];
  }

  Map<String, dynamic> toJson(dynamic Function(T value) toJsonT) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.results != null) {
      data['result'] = toJsonT(this.results!);
    }
    data['error'] = this.errors;
    return data;
  }
}
