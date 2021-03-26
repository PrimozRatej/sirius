import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sirius_flutter/assets/assets.dart';

import '../../helpers/ErrorHandler.dart';
import '../../helpers/ErrorHandler.dart';

class LoginService {
  String pathLogin = "/login";
  String pathSignUp = "/api/domain/user/sign_up";
  ErrorHandler erHandler;
  LoginService(BuildContext context){
    erHandler = new ErrorHandler(context,  PageType.LOGIN);
  }

  Future<String> attemptLogIn(String username, String password) async {
    Dio dio = new Dio();

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };


    AuthParam param = new AuthParam(username: username, password: password);
    var params = {'Content-Type': 'application/json'};
    Response response = new Response();
    try{
      response = await dio.post('https://10.0.2.2:8080/login',
          data: param.toJson(), queryParameters: params);
    }
    catch(e){
      erHandler.dioHandle(e);
    }


    String authJWTokken = response.headers.map["authorization"].first;
    return authJWTokken;
  }

  Future<int> attemptSignUp(
      String username, String password, String email) async {
    String url = Assets.domain + pathSignUp;
    var res = await http.post(url,
        body: {"username": username, "password": password, "email": email});
    return res.statusCode;
  }
}

class AuthParam {
  final String username;
  final String password;

  AuthParam({this.username, this.password});

  AuthParam.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
