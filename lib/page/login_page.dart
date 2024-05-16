
import 'package:bili2/http/dio/dio.dart';
import 'package:bili2/http/error/bi_error.dart';
import 'package:bili2/http/models/base_request.dart';
import 'package:bili2/http/models/base_response.dart';
import 'package:bili2/http/models/login_request.dart';
import 'package:bili2/http/net/bi_net.dart';
import 'package:bili2/utils/logger.dart';
import 'package:bili2/widget/appbar.dart';
import 'package:bili2/widget/login_input.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    // sendLoginRequest();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void sendLoginRequest() async {
     // 发起网络请求
    LoginRequest request = LoginRequest();
    request.add('userName', '15821461438').add('password', '123456');
    request.addH('course-flag', '1001');
    
    BaseReponse res = await BINet.send(request);
    logger.i(res.data);
  }

  // void testLogin() async {
  //   try {
  //     var response = await dio.get('https://api.devio.org/uapi/user/logout');
  //     logger.i(response.data);
  //   } on DioException catch (e) {
  //     throw BIException(message: e.toString());
  //   }
  // }

  void loginClick() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar('密码登录', '登录'),
        body: ListView(
          children: [
            LoginInput(onValueChanged: (String text) {
                  logger.i(text);
                },
                onFoucusChanged: (bool foucus) {

                },
                title: '用户名',
                hint: '请输入用户名',
                keyboardType: TextInputType.name),

            LoginInput(onValueChanged: (String text) {
                  logger.i(text);
                },
                onFoucusChanged: (bool foucus) {

                },
                title: '密码',
                hint: '请输入密码',
                keyboardType: TextInputType.visiblePassword),

            FractionallySizedBox(
              widthFactor: 1,
              child: InkWell(   
                onTap: loginClick,             
                child: Container(
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color.fromARGB(255, 185, 121, 167)
                  ),
                  margin: const EdgeInsets.all(12.0),
                  child: const Text('登录'),
                ),
              ),
            )
          ],
        ),
      );
  }
}
