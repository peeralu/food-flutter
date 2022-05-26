import 'package:hive/hive.dart';

part 'auth.g.dart';

@HiveType(typeId: 3)
class Auth {
  @HiveField(0)
  String? accessToken;

  @HiveField(1)
  String? refreshToken;

  Auth({
    this.accessToken,
    this.refreshToken,
  });

  Auth.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}
