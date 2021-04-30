import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/DioClient.dart';
import 'package:sirius_flutter/helpers/ErrorHandler.dart';
import 'package:sirius_flutter/helpers/UrlBuilder.dart';
import 'package:sirius_flutter/ixFrame/IxList/IxListService.dart';

import 'package:http/http.dart' as http;
import 'package:sirius_flutter/views/prod/export/ExportListDTO.dart';

class ExportListService implements IxObjectListService{

  BuildContext context;

  Dio dio;

  ErrorHandler erHandler;

  bool isLoading = true;

  String path = "/api/ware/exports";

  ExportListService(BuildContext context) {
    this.context = context;
    erHandler = new ErrorHandler(context, PageType.DEFAULT);
    dio = new DioClient().dio;
  }

  @override
  Future<ExportListDTO> getData([dto]) async {
    isLoading = true;
    String url = Assets.domain + path;
    Response response = new Response();
    try{
      response = await dio.post(url, data: dto);
    }
    catch(e){
      erHandler.dioHandle(e);
    }
    ExportListDTO list = ExportListDTO.fromJson(response.data);
    isLoading = false;
    return list;
  }
}
