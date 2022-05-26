import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/response/category.dart';
import 'package:food/app/modules/menu/menu_controller.dart';

class CategoryListWidget extends GetView<MenuController> {
  const CategoryListWidget({
    required this.category,
    this.isSelect = false,
    this.isLoading = false,
    required this.onSelect,
  });

  final Category category;
  final bool isSelect;
  final bool isLoading;
  final GestureTapCallback? onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        margin: EdgeInsets.only(left: spaceM),
        decoration: BoxDecoration(
          color: isSelect ? AppColors.lightGray.withOpacity(0.5) : null,
          borderRadius: AppBorderRadius.s,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: AppBorderRadius.s,
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: ImageService.loadImage(
                category.image,
                shimmer: AppColors.lightGray,
                fit: BoxFit.cover,
              ),
            ),
            verticalSpaceSS,
            Container(
              width: 80,
              height: 20,
              child: (category.name ?? "").b2.alignCenter.overflowEllipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryListFakeWidget extends GetView<MenuController> {
  const CategoryListFakeWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: spaceM),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Shimmer(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: AppBorderRadius.s,
              ),
            ),
          ),
          verticalSpaceSS,
          Shimmer(
            child: Container(
              width: 80,
              height: 20,
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: AppBorderRadius.ss,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
