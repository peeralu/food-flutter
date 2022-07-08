import 'package:food/app/core/theme/theme.dart';

import 'bloc/category_cubit.dart';
import 'bloc/food_cubit.dart';
import 'menu_controller.dart';
import 'widget/category_list_widget.dart';
import 'widget/food_list_widget.dart';

class MenuView extends GetView<MenuController> {
  final categoryCubit = Get.find<CategoryCubit>();
  final foodCubit = Get.find<FoodCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceS,
            _titleWidget(),
            verticalSpaceS,
            _searchView(),
            verticalSpaceM,
            _categoryWidget(),
            verticalSpaceSS,
            _titleCategoryWidget(),
            // verticalSpaceS,
            Expanded(child: _foodWidget()),
          ],
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: spaceL),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          'Food'.titleMenu,
          IconButton(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.zero,
            onPressed: controller.onLogout,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }

  Widget _searchView() {
    return FormBuilder(
      key: controller.formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: spaceM),
        child: InputFieldWidget(
          name: LocaleKeys.form_name,
          placeholder: LocaleKeys.form_name.tr,
          onChanged: controller.onSearch,
          suffix: IconButton(
            icon: Icon(Icons.close, color: AppColors.black),
            onPressed: () {
              controller.onSearch(null);
            },
          ),
        ),
      ),
    );
  }

  Widget _categoryWidget() {
    return BlocBuilder<CategoryCubit, CategoryState>(
      bloc: categoryCubit,
      builder: (context, state) {
        return state.when(
          hidden: () {
            return Container();
          },
          loading: () {
            return Container(
              height: 110,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                padding: EdgeInsets.only(right: spaceM),
                itemBuilder: (context, index) {
                  return CategoryListFakeWidget();
                },
              ),
            );
          },
          loaded: (current, categories) {
            return Container(
              height: 110,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                padding: EdgeInsets.only(right: spaceM),
                itemBuilder: (context, index) {
                  return CategoryListWidget(
                    category: categories[index],
                    isSelect: index == current,
                    onSelect: () {
                      controller.onSelect(index: index);
                    },
                  );
                },
              ),
            );
          },
          empty: () {
            return Container();
          },
        );
      },
    );
  }

  Widget _titleCategoryWidget() {
    return BlocBuilder<CategoryCubit, CategoryState>(
      bloc: categoryCubit,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return Shimmer(
              color: AppColors.lightGray,
              child: Container(
                width: 80,
                height: 30,
                margin: EdgeInsets.symmetric(horizontal: spaceM),
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: AppBorderRadius.ss,
                ),
              ),
            );
          },
          hidden: () {
            return Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: spaceM),
              child: "ค้นหา".titleCategory,
            );
          },
          orElse: () {
            return Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: spaceM),
              child: categoryCubit.fetchCategoryName().titleCategory,
            );
          },
        );
      },
    );
  }

  Widget _foodWidget() {
    return BlocBuilder<FoodCubit, FoodState>(
      bloc: foodCubit,
      builder: (context, state) {
        return state.when(
          loading: () {
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: spaceM, bottom: spaceM),
              itemCount: 10,
              itemBuilder: (context, index) {
                return FoodListFakeWidget();
              },
            );
          },
          loaded: (foods) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: spaceM, bottom: spaceM),
              itemCount: foods.length,
              itemBuilder: (context, index) {
                return FoodListWidget(
                  menu: foods[index],
                  onSelect: () {
                    controller.onDetail(menu: foods[index]);
                  },
                );
              },
            );
          },
          empty: () {
            return Container();
          },
        );
      },
    );
  }
}
