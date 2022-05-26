import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {
  @JsonKey(name: "first_name")
  final String firstName;

  @JsonKey(name: "last_name")
  final String lastName;

  Login({
    required this.firstName,
    required this.lastName,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
