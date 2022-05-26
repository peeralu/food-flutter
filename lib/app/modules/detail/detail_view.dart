import 'package:food/app/core/theme/theme.dart';

import 'detail_controller.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            Positioned.fill(
              bottom: (Get.height / 2) - spaceXXL,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(controller.menu.value.image ?? ""),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: Get.height / 2,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(spaceXL),
                    topRight: Radius.circular(spaceXL),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: spaceL, vertical: spaceL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (controller.menu.value.name ?? "").titleFood,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: AppColors.yellow, size: spaceM),
                            horizontalSpaceSSS,
                            controller.menu.value.starRating.toString().s1.color(AppColors.yellow).regular,
                          ],
                        ),
                        "${controller.detail.value.price.defaultData.currencyDefault} Bath".h4,
                      ],
                    ),
                    "Description".titleDescription,
                    (controller.detail.value.detail ?? "").detailDescription,
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(right: spaceS),
                child: Image.asset(
                  "assets/images/favorite_active.png",
                  width: spaceXXXXL,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SafeArea(
                child: GestureDetector(
                  onTap: controller.router.toBack,
                  child: Container(
                    margin: EdgeInsets.only(top: spaceM, left: spaceM),
                    child: CircleAvatar(
                      backgroundColor: AppColors.white.withOpacity(0.5),
                      radius: spaceL,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: spaceM),
                        child: Icon(Icons.arrow_back_ios, color: AppColors.black),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
