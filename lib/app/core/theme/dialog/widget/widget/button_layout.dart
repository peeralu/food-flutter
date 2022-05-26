import 'package:food/app/core/theme/theme.dart';

class ButtonLayoutDialog extends StatelessWidget {
  final Widget buttonOne;
  final Widget? buttonTwo;
  ButtonLayoutDialog({required this.buttonOne, this.buttonTwo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: spaceS),
      child: buttonTwo == null
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: spaceM),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 2,
                    child: buttonOne,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: spaceM),
              child: Row(
                children: [
                  Expanded(
                    child: buttonOne,
                  ),
                  horizontalSpaceM,
                  Expanded(
                    child: buttonTwo!,
                  ),
                ],
              ),
            ),
    );
  }
}
