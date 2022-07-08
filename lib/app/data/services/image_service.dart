import 'package:food/app/core/theme/theme.dart';

import 'assets_service.dart';

class ImageService {

  static Widget loadImage(
      String? url, {
        BoxFit fit = BoxFit.cover,
        Color shimmer = AppColors.darkGrey,
        String defaultImage = 'logo_black.png',
      }) {
    try {
      if (url == "" || url == null) {
        throw Error();
      }
      return CachedNetworkImage(
        fit: fit,
        imageUrl: url,
        placeholder: (context, url) {
          return Shimmer(
            child: Container(
              color: shimmer,
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Image.asset(AssetsService.image(defaultImage));
        },
      );
    } catch (error) {
      return Image.asset(AssetsService.image(defaultImage));
    }
  }
}
