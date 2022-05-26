import 'package:food/app/core/theme/theme.dart';
import 'package:food/app/data/models/response/auth.dart';

import 'local.dart';

class AuthLocal extends MapLocal<Auth> {
  AuthLocal({required Box<Auth> database}) : super(database: database);
}
