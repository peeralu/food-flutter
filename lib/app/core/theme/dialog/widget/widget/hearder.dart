import 'package:food/app/core/theme/theme.dart';

class HeaderDialog extends StatelessWidget {
  final String title;
  final String subTtitle;
  final Color color;

  HeaderDialog({required this.title, this.subTtitle = "", this.color = AppColors.black});

  HeaderDialog.success({required this.title, this.subTtitle = ""}) : color = AppColors.green;

  HeaderDialog.warning({required this.title, this.subTtitle = ""}) : color = AppColors.yellow;

  HeaderDialog.error({required this.title, this.subTtitle = ""}) : color = AppColors.red;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spaceXL, vertical: spaceS),
      child: Column(
        children: [
          ...checkTitle(),
          ...checkSubTitle(),
        ],
      ),
    );
  }

  List<Widget> checkTitle() {
    if (title != '') {
      return [
        title.h5.color(color).semiBold.alignCenter,
      ];
    }
    return [];
  }

  List<Widget> checkSubTitle() {
    if (subTtitle != '') {
      return [
        verticalSpaceS,
        subTtitle.h6.color(AppColors.black).regular.alignCenter,
      ];
    }
    return [];
  }
}
