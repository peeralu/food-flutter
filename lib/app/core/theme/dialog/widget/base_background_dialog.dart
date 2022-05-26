import 'package:food/app/core/theme/theme.dart';

class BaseBackgroundDialog extends GetResponsiveView {
  final List<Widget> children;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool showCloseIcon;
  final GestureTapCallback? onCompleteClicked;

  BaseBackgroundDialog({
    required this.children,
    this.backgroundColor,
    this.onCompleteClicked,
    this.borderColor,
    this.showCloseIcon = true,
  });

  @override
  Widget builder() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: backgroundWidget(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: spaceS),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget backgroundWidget({required Widget child}) {
    return Container(
      // margin: EdgeInsets.only(bottom: spaceM),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: backgroundColor ?? AppColors.white,
                borderRadius: AppBorderRadius.xl,
                border: Border.all(color: borderColor ?? AppColors.white),
              ),
              constraints: BoxConstraints(
                maxWidth: maxWidthScreen,
                maxHeight: maxHeightScreen,
              ),
              child: Container(
                child: Stack(
                  children: [
                    child,
                    closeWidget(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget closeWidget() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spaceS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(
              Icons.close_rounded,
              color: showCloseIcon ? AppColors.darkGrey : AppColors.transparent,
            ),
            onPressed: () {
              if (showCloseIcon) {
                Get.back();
              }
            },
          ),
        ],
      ),
    );
  }
}
