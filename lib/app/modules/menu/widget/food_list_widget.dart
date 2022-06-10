import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/response/category.dart';
import 'package:food/app/modules/menu/menu_controller.dart';

class FoodListWidget extends GetResponsiveView<MenuController> {
  FoodListWidget({required this.menu, required this.onSelect});

  final Menu menu;
  final GestureTapCallback onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: spaceM),
      child: GestureDetector(
        onTap: onSelect,
        child: Container(
          margin: EdgeInsets.only(bottom: spaceS),
          child: CardWidget(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: spaceS, vertical: spaceS),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.darkGrey,
                      borderRadius: AppBorderRadius.s,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: ImageService.loadImage(
                      menu.image,
                      fit: BoxFit.cover,
                      shimmer: AppColors.darkGrey,
                    ),
                  ),
                  horizontalSpaceM,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (menu.name ?? "").s1.semiBold.color(AppColors.black87),
                        (menu.detail ?? "").b1.color(AppColors.darkGrey).maxLine(1).overflowEllipsis,
                        Row(
                          children: [
                            Icon(Icons.star, color: AppColors.yellow, size: spaceM),
                            horizontalSpaceSSS,
                            menu.starRating.toString().s1.color(AppColors.yellow).regular,
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FoodListFakeWidget extends StatelessWidget {
  const FoodListFakeWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: spaceS),
      padding: EdgeInsets.symmetric(horizontal: spaceM),
      child: CardWidget(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: spaceS, vertical: spaceS),
          child: Row(
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
              horizontalSpaceM,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer(
                      child: Container(
                        width: double.infinity,
                        height: 15,
                        decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          borderRadius: AppBorderRadius.ss,
                        ),
                      ),
                    ),
                    verticalSpaceS,
                    Shimmer(
                      child: Container(
                        width: double.infinity,
                        height: 15,
                        decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          borderRadius: AppBorderRadius.ss,
                        ),
                      ),
                    ),
                    verticalSpaceS,
                    Shimmer(
                      child: Container(
                        width: double.infinity,
                        height: 15,
                        decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          borderRadius: AppBorderRadius.ss,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
