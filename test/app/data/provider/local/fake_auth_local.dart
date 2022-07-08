import 'package:food/app/data/models/response/auth.dart';
import 'package:food/app/data/provider/local/local.dart';

class FakeAuthLocal with MapDataSource<Auth> {
  Auth? auth;

  @override
  Auth? get() {
    return this.auth;
  }

  @override
  Future<void> add({required Auth data}) async {
    this.auth = data;
  }

  @override
  Future<void> delete() async {
    this.auth = null;
  }

  @override
  String get storageKey => "auth";
}
