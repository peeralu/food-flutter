part of 'category_cubit.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.hidden() = Hidden;
  const factory CategoryState.loading() = Loading;
  const factory CategoryState.loaded({required int current, required List<Category> categories}) = Loaded;
  const factory CategoryState.empty() = Empty;
}
