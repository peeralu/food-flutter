import 'package:food/app/core/theme/theme.dart';

extension ResponseApi on Response {
  bool get isOK {
    return HttpStatus(statusCode.defaultData).isOk && hasData;
  }

  bool get isNotOK {
    return !isOK;
  }

  bool get hasData {
    return data != null;
  }
}
