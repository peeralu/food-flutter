import 'package:food/app/core/theme/theme.dart';

import 'menu_controller.dart';
import 'widget/category_list_widget.dart';
import 'widget/food_list_widget.dart';

class MenuView extends GetView<MenuController> {
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
            verticalSpaceM,
            _foodWidget(),
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: spaceM),
      child: InputFieldWidget(
        name: LocaleKeys.form_name,
        placeholder: LocaleKeys.form_name.tr,
      ),
    );
  }

  Widget _categoryWidget() {
    return Container(
      height: 110,
      child: controller.obx(
        (state) {
          final list = state ?? [];
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            padding: EdgeInsets.only(right: spaceM),
            itemBuilder: (context, index) {
              return CategoryListWidget(
                category: list[index],
                isSelect: index == controller.currentCategory,
                onSelect: () {
                  controller.onSelect(index: index);
                },
              );
            },
          );
        },
        onLoading: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          padding: EdgeInsets.only(right: spaceM),
          itemBuilder: (context, index) {
            return CategoryListFakeWidget();
          },
        ),
      ),
    );
  }

  Widget _titleCategoryWidget() {
    return controller.obx(
      (state) {
        return Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: spaceM),
          child: controller.titleCategory.value.titleCategory,
        );
      },
      onLoading: Shimmer(
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
      ),
    );
  }

  Widget _foodWidget() {
    return controller.obx(
      (state) {
        return Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: spaceM),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: spaceSS, bottom: spaceM),
              itemCount: controller.menu.length,
              itemBuilder: (context, index) {
                return FoodListWidget(
                  menu: controller.menu[index],
                  onSelect: () {
                    controller.onDetail(menu: controller.menu[index]);
                  },
                );
              },
            ),
          ),
        );
      },
      onLoading: Expanded(
        child: Container(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: spaceSS, bottom: spaceM),
            itemCount: 10,
            itemBuilder: (context, index) {
              return FoodListFakeWidget();
            },
          ),
        ),
      ),
    );
  }
}
