import 'package:food/app/core/theme/theme.dart';

import 'base_background_dialog.dart';
import 'widget/hearder.dart';
import 'widget/body.dart';
import 'widget/footer.dart';
import 'widget/button_layout.dart';

enum DialogStyle { none, success, warning, error }

class DefaultDialog extends StatelessWidget {
  final DialogStyle style;
  final Widget? icon;
  final Image? image;
  final String headerTitle;
  final String headerSubTitle;
  final String bodyTitle;
  final String bodySubTitle;
  final Color bodyBackgroundColor;
  final EdgeInsets? bodyPadding;
  final Widget? bodyChild;
  final String footerTitle;
  final String footerSubTitle;
  final Widget buttonOne;
  final Widget? buttonTwo;

  DefaultDialog({
    this.style = DialogStyle.none,
    this.icon,
    this.image,
    this.headerTitle = "",
    this.headerSubTitle = "",
    this.bodyTitle = "",
    this.bodySubTitle = "",
    this.bodyBackgroundColor = AppColors.white,
    this.bodyPadding,
    this.bodyChild,
    this.footerTitle = "",
    this.footerSubTitle = "",
    required this.buttonOne,
    this.buttonTwo,
  });

  @override
  Widget build(BuildContext context) {
    return BaseBackgroundDialog(
      showCloseIcon: false,
      children: [
        verticalSpaceM,
        if (icon != null) icon!,
        if (image != null) image!,
        verticalSpaceS,
        _header(),
        _body(),
        _footer(),
        verticalSpaceM,
        ButtonLayoutDialog(
          buttonOne: buttonOne,
          buttonTwo: buttonTwo,
        ),
        verticalSpaceM,
      ],
    );
  }

  Widget _header() {
    switch (style) {
      case DialogStyle.success:
        return HeaderDialog.success(
          title: headerTitle,
          subTtitle: headerSubTitle,
        );
      case DialogStyle.warning:
        return HeaderDialog.warning(
          title: headerTitle,
          subTtitle: headerSubTitle,
        );
      case DialogStyle.error:
        return HeaderDialog.error(
          title: headerTitle,
          subTtitle: headerSubTitle,
        );
      case DialogStyle.success:
        return HeaderDialog.error(
          title: headerTitle,
          subTtitle: headerSubTitle,
        );
      default:
        return HeaderDialog(
          title: headerTitle,
          subTtitle: headerSubTitle,
        );
    }
  }

  Widget _body() {
    if (bodyTitle != "" || bodySubTitle != "" || bodyChild != null) {
      return BodyDialog(
        title: bodyTitle,
        subTtitle: bodySubTitle,
        colorBlackground: bodyBackgroundColor,
        bodyPadding: bodyPadding,
        child: bodyChild,
      );
    }
    return Container();
  }

  Widget _footer() {
    return FooterDialog(
      title: footerTitle,
      subTtitle: footerSubTitle,
    );
  }
}
