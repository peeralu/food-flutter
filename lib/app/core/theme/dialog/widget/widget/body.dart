import 'package:food/app/core/theme/theme.dart';

class BodyDialog extends StatelessWidget {
  final Color colorBlackground;
  final String title;
  final String subTtitle;
  final EdgeInsets? bodyPadding;
  final Widget? child;

  BodyDialog({
    this.title = "",
    this.subTtitle = "",
    this.bodyPadding,
    this.colorBlackground = AppColors.lightGray,
    this.child,
  });

  BodyDialog.lightGrey({
    this.title = "",
    this.subTtitle = "",
    this.bodyPadding,
    this.child,
  }) : colorBlackground = AppColors.lightGray;

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return Container(child: child);
    }
    return Container(
      width: double.infinity,
      color: colorBlackground,
      margin: EdgeInsets.symmetric(vertical: spaceS),
      child: Padding(
        padding: bodyPadding ?? EdgeInsets.all(spaceM),
        child: checkCustom(),
      ),
    );
  }

  Widget checkCustom() {
    if (child != null) {
      return child!;
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: spaceL),
        child: Column(
          children: [
            ...checkTitle(),
            verticalSpaceSS,
            ...checkSubTitle(),
          ],
        ),
      );
    }
  }

  List<Widget> checkTitle() {
    if (title != '') {
      return [
        title.h6.color(AppColors.black).medium.alignCenter,
      ];
    }
    return [];
  }

  List<Widget> checkSubTitle() {
    if (subTtitle != '') {
      return [
        subTtitle.b1.color(AppColors.black87).regular.alignCenter,
      ];
    }
    return [];
  }
}
