import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/response/auth.dart';
import 'package:food/app/data/provider/local/auth_local.dart';
import 'package:food/app/data/provider/local/hive.dart';
import 'package:food/app/data/repository/auth_repository.dart';
import 'package:food/app/data/repository/food_repository.dart';

class AppBinding {
  static Future initial() async {
    /// [LogService] :: [initialize]
    await LogService.initialize();

    /// [Hive] :: [initialize]
    await HiveStorage.initialize();
    final authBox = await HiveStorage.openBox<Auth>();

    final logService = Get.find<LogService>();

    /// [ApiService] :: [initialize]
    final dio = ApiService.createDio(logService: logService);
    final _apiService = ApiService(dio: dio);

    Get.lazyPut<AuthRepository>(
          () => AuthRepositoryImpl(
        apiService: _apiService,
        authLocal: AuthLocal(database: authBox),
      ),
      fenix: true,
    );

    // final categoryBox = await LocalHive.openBox<Category>();
    Get.lazyPut<FoodRepository>(
          () => FoodRepositoryImpl(
        apiService: _apiService,
        // database: dbFood,
      ),
      fenix: true,
    );

    /// [Management] :: [initialize]
    Get.put(DialogManagement());

    _setLoadingProgressDialog();
  }

  static void _setLoadingProgressDialog() {
    EasyLoading.instance
      ..displayDuration = Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..maskType = EasyLoadingMaskType.custom
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = spaceXXXL
      ..radius = spaceM
      ..progressColor = AppColors.yellow
      ..backgroundColor = AppColors.white
      ..indicatorColor = AppColors.yellow
      ..textColor = AppColors.yellow
      ..userInteractions = true
      ..dismissOnTap = false;
  }
}
