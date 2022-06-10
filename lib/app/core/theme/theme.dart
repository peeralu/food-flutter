//--------------------------------------- Theme --------------------------------------- //
export 'package:food/app/core/theme/colors.dart';
export 'package:food/app/core/theme/space.dart';
export 'package:food/app/core/theme/shadow.dart';
export 'package:food/app/core/theme/border_radius.dart';
export 'package:food/app/core/theme/button.dart';
export 'package:food/app/core/theme/input_field.dart';
export 'package:food/app/core/theme/text_style.dart';
export 'package:food/app/core/theme/loading.dart';
export 'package:food/app/core/theme/card_widget.dart';

//--------------------------------------- utils --------------------------------------- //
export 'package:food/app/core/utils/config.dart';

//--------------------------------------- Provider --------------------------------------- //
export 'package:food/app/data/models/request/base_request.dart';
export 'package:food/app/data/provider/remote/api_service.dart';
export 'package:food/app/data/models/response/base_result.dart';

//--------------------------------------- Extension --------------------------------------- //
export 'package:food/app/core/extension/dio.dart';
export 'package:food/app/core/extension/int.dart';
export 'package:food/app/core/extension/response.dart';
export 'package:food/app/core/extension/textless.dart';

//--------------------------------------- Locale Keys --------------------------------------- //
export 'package:food/generated/locales.g.dart';
export 'package:food/app/routes/app_pages.dart';

//--------------------------------------- Service --------------------------------------- //
export 'package:food/app/data/services/language_service.dart';
export 'package:food/app/data/services/assets_service.dart';
export 'package:food/app/data/services/image_service.dart';
export 'package:food/app/data/services/notification_center.dart';
export 'package:food/app/data/services/keyboard_service.dart';
export 'package:food/app/data/services/log_service.dart';
export 'package:food/app/modules/global_widgets/app_router.dart';
export 'package:food/app/modules/global_widgets/app_controller.dart';

//--------------------------------------- Management --------------------------------------- //
export 'package:food/app/data/services/managert/dialog_management.dart';

//--------------------------------------- pub.dev --------------------------------------- //
export 'package:flutter/material.dart';
export 'package:logger/logger.dart';
export 'package:flutter_easyloading/flutter_easyloading.dart';
export 'package:flutter_svg/svg.dart';
export 'package:flutter_vector_icons/flutter_vector_icons.dart';
export 'package:textless/textless.dart';
export 'package:shimmer_animation/shimmer_animation.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:flutter_form_builder/flutter_form_builder.dart';
export 'package:dio/dio.dart' hide FormData, MultipartFile;
export 'package:get/get.dart' hide Response;
export 'package:get/get_connect/http/src/status/http_status.dart';
export 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
export 'package:get_storage/get_storage.dart';
export 'package:connectivity_plus/connectivity_plus.dart';
export 'package:hive/hive.dart';
export 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
