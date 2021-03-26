import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sirius_flutter/helpers/ErrorHandler.dart';

abstract class IxObjectService {
  bool isLoading = false;
  Dio dio;
  String path;
  BuildContext context;
  ErrorHandler erHandler;

  Future<dynamic> getData([dynamic dto]);
}
