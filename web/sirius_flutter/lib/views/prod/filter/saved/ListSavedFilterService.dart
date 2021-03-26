import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/DioClient.dart';
import 'package:sirius_flutter/helpers/ErrorHandler.dart';
import 'package:sirius_flutter/helpers/UrlBuilder.dart';
import 'package:sirius_flutter/ixFrame/IxList/IxListService.dart';
import 'package:http/http.dart' as http;
import 'package:sirius_flutter/views/prod/filter/ProdFilterDTO.dart';

import 'ListSavedFilterDTO.dart';

class ProdSavedFilterServices {
  BuildContext context;
  Dio dio;
  ErrorHandler erHandler;
  bool isLoading = true;
  String path = "/api/ware/filters";

  ProdSavedFilterServices(BuildContext context) {
    this.context = context;
    erHandler = new ErrorHandler(context, PageType.DEFAULT);
    dio = new DioClient().dio;
  }

  Future<ProdListSavedFilterDTO> getData(bool isPublic, String objName) async {
    isLoading = true;
    String url = Assets.domain + path;
    url = url + "?isPublic=$isPublic&objName=$objName";
    Response response = new Response();
    try{
      response = await dio.get(url);
    }
    catch(e){
      erHandler.dioHandle(e);
    }
    ProdListSavedFilterDTO productsList = ProdListSavedFilterDTO.fromJson(response.data);
    isLoading = false;
    return productsList;
  }

  void saveData([dto]) async {
    isLoading = true;
    String url = Assets.domain + path;
    Response response = new Response();
    try{
      response = await dio.post(url, data : dto, options: Options(
          method: 'POST',
          responseType: ResponseType.json // or ResponseType.JSON
      ));
      print(response);
    }
    catch(e){
      erHandler.dioHandle(e);
    }
    ProdListSavedFilterDTO productsList = ProdListSavedFilterDTO.fromJson(response.data);
    isLoading = false;
  }

  void deleteData([dto]) async {
    isLoading = true;
    String url = Assets.domain + path;
    Response response = new Response();
    try{
      response = await dio.delete(url, data : dto, options: Options(
          method: 'POST',
          responseType: ResponseType.plain // or ResponseType.JSON
      ));
    }
    catch(e){
      erHandler.dioHandle(e);
    }
    isLoading = false;
  }
}
