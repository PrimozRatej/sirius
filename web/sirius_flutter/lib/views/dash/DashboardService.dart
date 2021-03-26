import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/DioClient.dart';
import 'package:sirius_flutter/helpers/Util.dart';
import 'package:sirius_flutter/helpers/ErrorHandler.dart';
import 'package:sirius_flutter/helpers/SharedStorage.dart';
import 'package:sirius_flutter/helpers/UrlBuilder.dart';
import 'package:sirius_flutter/ixFrame/IxObject/IxObjectService.dart';
import 'package:sirius_flutter/views/login/LoginController.dart';

import '../../helpers/ErrorHandler.dart';
import 'DashboardDTO.dart';

class DashboardService implements IxObjectService {
  @override
  bool isLoading;
  @override
  Dio dio;
  @override
  String path = "/api/ware/dashboard";
  @override
  BuildContext context;
  @override
  ErrorHandler erHandler;

  DashboardService(BuildContext context) {
    this.context = context;
    erHandler = new ErrorHandler(context, PageType.DEFAULT);
    dio = new DioClient().dio;
  }

  @override
  Future<DashboardDTO> getData([dynamic dto]) async {
    Response response = new Response();
    try{
      response = await dio.get(Assets.domain + path);
    }
    catch(e){
      erHandler.dioHandle(e);
    }
    return DashboardDTO.fromJson(response.data);
  }
}
