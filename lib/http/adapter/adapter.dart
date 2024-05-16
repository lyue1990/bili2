
import 'package:bili2/http/models/base_request.dart';
import 'package:bili2/http/models/base_response.dart';

abstract class BaseAdapter {

  Future<BaseReponse> send(BaseRequest request);
  
}