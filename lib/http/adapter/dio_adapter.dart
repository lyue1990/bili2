

import 'package:bili2/http/adapter/adapter.dart';
import 'package:bili2/http/error/bi_error.dart';
import 'package:bili2/utils/logger.dart';
import 'package:dio/dio.dart';

import '../dio/dio.dart';
import '../models/base_request.dart';
import '../models/base_response.dart';

class DioAdapter extends BaseAdapter {


  @override
  Future<BaseReponse> send(BaseRequest request) async {
   
   var response;

   Options options = Options(headers: request.headers);
   
   try {
     if (request.method == HTTPMethod.get) {
     response = await dio.get(request.url, queryParameters: request.params, options: options);
   } else if (request.method == HTTPMethod.post) {
     response = await dio.post(request.url, queryParameters: request.params, options: options);
   }
   } on DioException catch (e) {
     throw BIException(message: e.toString());
   } catch (e) {
     throw BIException(message: e.toString());
   }
   logger.i(response);

    if (response!.statusCode == 200) {
      // 转码 response.data
      return BaseReponse(statusCode: response.statusCode, data: response.statusMessage);
    } else {
      throw BIException(code:response.statusCode, message: '网络请求发生错误');
    }
  }

  
  
}