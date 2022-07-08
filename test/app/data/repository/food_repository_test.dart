import 'package:flutter_test/flutter_test.dart';
import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/request/food/food_detail_request.dart';
import 'package:food/app/data/models/request/food/food_favorite_request.dart';
import 'package:food/app/data/models/response/category.dart';
import 'package:food/app/data/repository/food_repository.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repository_test.dart';

main() {
  late ApiService apiService;
  late FoodRepository repository;

  setUp(() {
    apiService = MockApiService();
    repository = FoodRepositoryImpl(
      apiService: apiService,
    );
  });

  test("fetch detail return success", () async {
    int foodId = 11;
    final foodDetailRequest = FoodDetailRequest(
      foodId: foodId,
    );
    int id = 1;
    String name = "name";
    String image = "image";
    String detail = "detail";
    double starRating = 2.3;
    int price = 4;
    bool isFavorite = true;
    final menuDetail = MenuDetail(
      id: id,
      name: name,
      image: image,
      detail: detail,
      starRating: starRating,
      price: price,
      isFavorite: isFavorite,
    );
    ResultData<MenuDetail> resultData = ResultData.success(menuDetail);
    when(
      () => apiService.requestData<MenuDetail>(baseRequest: foodDetailRequest),
    ).thenAnswer((_) async => resultData);

    final result = await repository.fetchDetail(request: foodDetailRequest);

    expect(result.data?.id, id);
    expect(result.data?.name, name);
    expect(result.data?.image, image);
    expect(result.data?.detail, detail);
    expect(result.data?.starRating, starRating);
    expect(result.data?.price, price);
    expect(result.data?.isFavorite, isFavorite);
    expect(result.error, null);
    expect(result.isSuccess, true);
    expect(result.isFailure, false);
  });

  test("fetch detail return error", () async {
    int foodId = 11;
    final foodDetailRequest = FoodDetailRequest(
      foodId: foodId,
    );
    String errorMessage = "Api error.";
    Failure failure = ApiServiceFailure(message: errorMessage);
    ResultData<MenuDetail> resultData = ResultData.failure(failure);
    when(
      () => apiService.requestData<MenuDetail>(baseRequest: foodDetailRequest),
    ).thenAnswer((_) async => resultData);

    final result = await repository.fetchDetail(request: foodDetailRequest);

    expect(result.data, null);
    expect(result.error?.message, errorMessage);
    expect(result.isSuccess, false);
    expect(result.isFailure, true);
  });

  test("fetch favorite return success", () async {
    int foodId = 11;
    final foodFavoriteRequest = FoodFavoriteRequest(
      foodId: foodId,
    );
    String data = "success";
    ResultData<String> resultData = ResultData.success(data);
    when(
      () => apiService.requestData<String>(baseRequest: foodFavoriteRequest),
    ).thenAnswer((_) async => resultData);

    final result = await repository.fetchFavorite(
      request: foodFavoriteRequest,
    );

    expect(result.data, data);
    expect(result.error, null);
    expect(result.isSuccess, true);
    expect(result.isFailure, false);
  });

  test("fetch favorite return error", () async {
    int foodId = 11;
    final foodFavoriteRequest = FoodFavoriteRequest(
      foodId: foodId,
    );
    String errorMessage = "Api error.";
    Failure failure = ApiServiceFailure(message: errorMessage);
    ResultData<String> resultData = ResultData.failure(failure);
    when(
      () => apiService.requestData<String>(baseRequest: foodFavoriteRequest),
    ).thenAnswer((_) async => resultData);

    final result = await repository.fetchFavorite(
      request: foodFavoriteRequest,
    );

    expect(result.data, null);
    expect(result.error?.message, errorMessage);
    expect(result.isSuccess, false);
    expect(result.isFailure, true);
  });
}
