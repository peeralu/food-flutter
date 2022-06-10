import 'package:bloc/bloc.dart';
import 'package:food/app/data/models/response/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'food_state.dart';
part 'food_cubit.freezed.dart';

class FoodCubit extends Cubit<FoodState> {
  static FoodCubit get instead => Get.find<FoodCubit>();

  List<Menu> _menus = [];

  FoodCubit() : super(Loading());

  Future<void> updateData({required List<Menu> menus}) async {
    emit(Loading());
    await Future.delayed(Duration(milliseconds: 300));
    _menus = menus;
    if (_menus.isEmpty) {
      emit(Empty());
    } else {
      emit(Loaded(menus: _menus));
    }
  }
}
