

import 'package:bili2/http/adapter/dio_adapter.dart';
import 'package:bili2/http/models/base_request.dart';
import 'package:bili2/http/models/base_response.dart';

class BINet {

  BINet._();
  static BINet? _instance;
  static BINet get instance {
    _instance ??= BINet._();
    return _instance!;
  }

  static Future<BaseReponse> send(BaseRequest request) async {
    var adapter = DioAdapter();
    return await adapter.send(request); 
  }
}