import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'Util.dart';

class DioClient{
  Dio dio;

  DioClient(){
    dio = new Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    dio.options.headers["authorization"] = Util.tokenJWT;
  }
}