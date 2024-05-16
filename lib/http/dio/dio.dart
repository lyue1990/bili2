

import 'package:dio/dio.dart';

final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.devio.org/uapi/' ,sendTimeout: const Duration(seconds: 15)));