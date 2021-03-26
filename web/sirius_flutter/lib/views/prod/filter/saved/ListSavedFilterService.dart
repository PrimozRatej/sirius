import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/ErrorHandler.dart';
import 'package:sirius_flutter/helpers/UrlBuilder.dart';
import 'package:sirius_flutter/ixFrame/IxList/IxListService.dart';
import 'package:http/http.dart' as http;
import 'package:sirius_flutter/views/prod/filter/ProdFilterDTO.dart';

import 'ProdListSavedFilterDTO.dart';

class ProdSavedFilterServices implements IxObjectListService {
  @override
  BuildContext context;
  @override
  Dio dio;
  @override
  ErrorHandler erHandler;
  @override
  bool isLoading = true;
  @override
  String path = "/api/ware/filters";

  @override
  Future<ProdListSavedFilterDTO> getData([dto]) async {
    isLoading = true;
    String url = Assets.domain + path;
    if (dto != null) url = url + UrlBuilder.buildUrl(dto.toJson());
    Response response = new Response();
    try{
      response = await dio.get(Assets.domain + path);
    }
    catch(e){
      erHandler.dioHandle(e);
    }
    ProdListSavedFilterDTO productsList = ProdListSavedFilterDTO.fromJson(response.data);
    isLoading = false;
    return productsList;
  }
}
