

import 'package:bili2/http/models/base_request.dart';

class LoginRequest extends BaseRequest {
  @override
  HTTPMethod get method {
    return HTTPMethod.post;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return 'user/login';
  }
}