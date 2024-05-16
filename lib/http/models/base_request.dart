
import 'package:bili2/utils/logger.dart';

enum HTTPMethod {
  post,
  get,
}

abstract class BaseRequest {

  final String authority = 'api.devio.org/uapi/';

  String path();

  HTTPMethod get method;

  bool needLogin();

  var pathParams;

  var usehttp = true;

  Map<String, dynamic> params = {};

  BaseRequest add(String k, dynamic v) {
    params[k] = v.toString();
    return this;
  }

  

  Map<String, String> headers = {};

  BaseRequest addH(String k, String v) {
    headers[k] = v;
    return this;
  }

  String get url {
    String pathUrl = path();
    if (pathParams != null) {
      if(path().endsWith('/')) {
        pathUrl = "${path()}$pathParams";
      } else {
        pathUrl = "${path()}/$pathParams";
      }
    }

    Uri uri;
    if(usehttp) {
      uri = Uri.http(authority, pathUrl, pathParams);
    } else {
      uri = Uri.https(authority, pathUrl, pathParams);
    }
    logger.i(uri.toString());

    return uri.toString();
  }
}