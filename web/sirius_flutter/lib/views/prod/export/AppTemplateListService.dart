import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/DioClient.dart';
import 'package:sirius_flutter/helpers/ErrorHandler.dart';
import 'package:sirius_flutter/helpers/UrlBuilder.dart';
import 'package:sirius_flutter/ixFrame/IxList/IxListService.dart';

import 'package:http/http.dart' as http;
import 'package:sirius_flutter/views/prod/export/AppTemplateListDTO.dart';

class AppTemplateListService implements IxObjectListService{

  BuildContext context;

  Dio dio;

  ErrorHandler erHandler;

  bool isLoading = true;

  String path = "/api/domain/app_template";

  AppTemplateListService(BuildContext context) {
    this.context = context;
    erHandler = new ErrorHandler(context, PageType.DEFAULT);
    dio = new DioClient().dio;
  }

  @override
  Future<AppTemplateListDTO> getData([dto]) async {
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
    AppTemplateListDTO productsList = AppTemplateListDTO.fromJson(response.data);
    isLoading = false;
    return productsList;
  }
}
