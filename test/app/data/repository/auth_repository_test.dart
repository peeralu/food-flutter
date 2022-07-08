import 'package:flutter_test/flutter_test.dart';
import 'package:food/app/data/models/request/auth/login_request.dart';
import 'package:food/app/data/models/request/auth/refresh_token_request.dart';
import 'package:food/app/data/models/request/auth/register_request.dart';
import 'package:food/app/data/models/response/auth.dart';
import 'package:food/app/data/models/response/base_result.dart';
import 'package:food/app/data/provider/local/local.dart';
import 'package:food/app/data/provider/remote/api_service.dart';
import 'package:food/app/data/repository/auth_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../provider/local/fake_auth_local.dart';

class MockApiService extends Mock implements ApiService {}

main() {
  late ApiService apiService;
  late MapDataSource<Auth> authLocal;
  late AuthRepository repository;

  setUp(() {
    apiService = MockApiService();
    authLocal = FakeAuthLocal();
    repository = AuthRepositoryImpl(
      apiService: apiService,
      authLocal: authLocal,
    );
  });

  test("fetch login return success", () async {
    String email = "email";
    String password = "password";
    final loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    String accessToken = "abc123";
    String refreshToken = "xyz456";
    Auth auth = Auth(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    ResultData<Auth> resultData = ResultData.success(auth);
    when(
      () => apiService.requestData<Auth>(baseRequest: loginRequest),
    ).thenAnswer((_) async => resultData);

    final result = await repository.fetchLogin(request: loginRequest);

    expect(result.data?.accessToken, accessToken);
    expect(result.data?.refreshToken, refreshToken);
    expect(result.isSuccess, true);
    expect(result.isFailure, false);
  });

  test("fetch login return failure", () async {
    String email = "email";
    String password = "password";
    final loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    String errorMessage = "Api error.";
    Failure failure = ApiServiceFailure(message: errorMessage);
    ResultData<Auth> resultData = ResultData.failure(failure);
    when(
      () => apiService.requestData<Auth>(baseRequest: loginRequest),
    ).thenAnswer((_) async => resultData);

    final result = await repository.fetchLogin(request: loginRequest);

    expect(result.data, null);
    expect(result.error?.message, errorMessage);
    expect(result.isSuccess, false);
    expect(result.isFailure, true);
  });

  test("fetch register return success", () async {
    String email = "email";
    String password = "password";
    String name = "name";
    String mobile = "mobile";
    String address = "address";
    final registerRequest = RegisterRequest(
      email: email,
      password: password,
      name: name,
      mobile: mobile,
      address: address,
    );
    String accessToken = "abc123";
    String refreshToken = "xyz456";
    Auth auth = Auth(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    ResultData<Auth> resultData = ResultData.success(auth);
    when(
      () => apiService.requestData<Auth>(baseRequest: registerRequest),
    ).thenAnswer((_) async => resultData);

    final result = await repository.fetchRegister(request: registerRequest);

    expect(result.data?.accessToken, accessToken);
    expect(result.data?.refreshToken, refreshToken);
    expect(result.isSuccess, true);
    expect(result.isFailure, false);
  });

  test("fetch register return error", () async {
    String email = "email";
    String password = "password";
    String name = "name";
    String mobile = "mobile";
    String address = "address";
    final registerRequest = RegisterRequest(
      email: email,
      password: password,
      name: name,
      mobile: mobile,
      address: address,
    );
    String errorMessage = "Api error.";
    Failure failure = ApiServiceFailure(message: errorMessage);
    ResultData<Auth> resultData = ResultData.failure(failure);
    when(
      () => apiService.requestData<Auth>(baseRequest: registerRequest),
    ).thenAnswer((_) async => resultData);

    final result = await repository.fetchRegister(request: registerRequest);

    expect(result.data, null);
    expect(result.error?.message, errorMessage);
    expect(result.isSuccess, false);
    expect(result.isFailure, true);
  });

  test("fetch refresh token return success", () async {
    final refreshTokenRequest = RefreshTokenRequest(
      refreshToken: "123456",
    );
    String accessToken = "abc123";
    String refreshToken = "xyz456";
    Auth auth = Auth(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    ResultData<Auth> resultData = ResultData.success(auth);
    when(
      () => apiService.requestData<Auth>(baseRequest: refreshTokenRequest),
    ).thenAnswer((_) async => resultData);

    final result = await repository.fetchRefreshToken(
      request: refreshTokenRequest,
    );

    expect(result.data?.accessToken, accessToken);
    expect(result.data?.refreshToken, refreshToken);
    expect(result.isSuccess, true);
    expect(result.isFailure, false);
  });

  test("fetch refresh token return error", () async {
    final refreshTokenRequest = RefreshTokenRequest(
      refreshToken: "123456",
    );
    String errorMessage = "Api error.";
    Failure failure = ApiServiceFailure(message: errorMessage);
    ResultData<Auth> resultData = ResultData.failure(failure);
    when(
      () => apiService.requestData<Auth>(baseRequest: refreshTokenRequest),
    ).thenAnswer((_) async => resultData);

    final result = await repository.fetchRefreshToken(
      request: refreshTokenRequest,
    );

    expect(result.data, null);
    expect(result.error?.message, errorMessage);
    expect(result.isSuccess, false);
    expect(result.isFailure, true);
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
