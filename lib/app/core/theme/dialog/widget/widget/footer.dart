import 'package:food/app/core/theme/theme.dart';

class FooterDialog extends StatelessWidget {
  final String title;
  final String subTtitle;
  final Color color;

  FooterDialog({required this.title, this.subTtitle = "", this.color = AppColors.black});

  FooterDialog.success({required this.title, this.subTtitle = ""}) : color = AppColors.green;

  FooterDialog.warning({required this.title, this.subTtitle = ""}) : color = AppColors.yellow;

  FooterDialog.error({required this.title, this.subTtitle = ""}) : color = AppColors.red;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...checkTitle(),
        ...checkSubTitle(),
      ],
    );
  }

  List<Widget> checkTitle() {
    if (title != '') {
      return [
        title.s1.color(color).regular,
      ];
    }
    return [];
  }

  List<Widget> checkSubTitle() {
    if (subTtitle != '') {
      return [
        verticalSpaceS,
        subTtitle.s2.color(AppColors.darkGrey).regular.alignCenter,
      ];
    }
    return [];
  }
}
