part of 'food_cubit.dart';

@freezed
class FoodState with _$FoodState {
  const factory FoodState.loading() = Loading;
  const factory FoodState.loaded({required List<Menu> menus}) = Loaded;
  const factory FoodState.empty() = Empty;
}
