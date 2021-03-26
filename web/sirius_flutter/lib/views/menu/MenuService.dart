import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/DioClient.dart';
import 'package:sirius_flutter/helpers/Util.dart';
import 'package:sirius_flutter/helpers/ErrorHandler.dart';
import 'package:sirius_flutter/helpers/SharedStorage.dart';
import 'package:sirius_flutter/ixFrame/IxObject/IxObjectService.dart';
import 'package:sirius_flutter/views/menu/MenuDTO.dart';

import '../../helpers/ErrorHandler.dart';
import 'MenuService.dart';

class MenuService implements IxObjectService {
  @override
  bool isLoading;
  @override
  String path = "/api/util/menu";
  @override
  BuildContext context;
  @override
  ErrorHandler erHandler;
  @override
  Dio dio;

  MenuService(BuildContext context) {
    this.context = context;
    erHandler = new ErrorHandler(context, PageType.DEFAULT);
    dio = new DioClient().dio;
  }

  @override
  Future<MenuDTO> getData([dynamic dto]) async {
    Response response = new Response();
    try {
      response = await dio.get(Assets.domain + path);
    } catch (e) {
      erHandler.dioHandle(e);
    }
    return MenuDTO.fromJson(response.data);
  }
}
