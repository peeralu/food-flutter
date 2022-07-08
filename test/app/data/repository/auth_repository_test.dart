import 'package:flutter_test/flutter_test.dart';
import 'package:food/app/data/models/response/auth.dart';
import 'package:food/app/data/provider/local/local.dart';
import 'package:food/app/data/provider/remote/api_service.dart';
import 'package:food/app/data/repository/auth_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../provider/local/fake_auth_local.dart';

class MockApiService extends Mock implements ApiService {}

main() {
  late MapDataSource<Auth> authLocal;
  late AuthRepository repository;

  setUp(() {
    authLocal = FakeAuthLocal();
    repository = AuthRepositoryImpl(
      apiService: MockApiService(),
      authLocal: authLocal,
    );
  });

  test("get local return null", () {
    final result = repository.getLocal();

    expect(result, null);
  });

  test("add local already get local return auth", () async {
    String accessToken = "abc123";
    String refreshToken = "xyz456";
    final data = Auth(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );

    await repository.addLocal(data: data);

    final result = repository.getLocal();
    expect(result?.accessToken, accessToken);
    expect(result?.refreshToken, refreshToken);
  });

  test("add local already delete local return null", () async {
    String accessToken = "abc123";
    String refreshToken = "xyz456";
    final data = Auth(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    await repository.addLocal(data: data);

    await repository.deleteLocal();

    final result = repository.getLocal();
    expect(result, null);
  });
}
