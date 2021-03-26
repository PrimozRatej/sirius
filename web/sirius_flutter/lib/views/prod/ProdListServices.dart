import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/DioClient.dart';
import 'package:sirius_flutter/helpers/ErrorHandler.dart';
import 'package:sirius_flutter/helpers/Util.dart';
import 'package:sirius_flutter/helpers/SharedStorage.dart';
import 'package:sirius_flutter/helpers/UrlBuilder.dart';
import 'package:sirius_flutter/ixFrame/IxList/IxListService.dart';

import 'ProdListDTO.dart';
import 'package:http/http.dart' as http;

class ProdListServices implements IxObjectListService{

  BuildContext context;

  Dio dio;

  ErrorHandler erHandler;

  bool isLoading = true;

  String path = "/api/ware/products";

  ProdListServices(BuildContext context) {
    this.context = context;
    erHandler = new ErrorHandler(context, PageType.DEFAULT);
    dio = new DioClient().dio;
  }

  @override
  Future<ProdListDTO> getData([dto]) async {
    isLoading = true;
    String url = Assets.domain + path;
    if (dto != null) url = url + UrlBuilder.toUrl(dto.toJson());
    Response response = new Response();
    try{
      response = await dio.get(url);
    }
    catch(e){
      erHandler.dioHandle(e);
    }
    ProdListDTO productsList = ProdListDTO.fromJson(response.data);
    isLoading = false;
    return productsList;
  }
}
