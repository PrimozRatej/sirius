import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/DioClient.dart';
import 'package:sirius_flutter/helpers/ErrorHandler.dart';
import 'package:sirius_flutter/helpers/UrlBuilder.dart';
import 'package:sirius_flutter/ixFrame/IxList/IxListService.dart';

import 'QuantityTypeLookupModelDTO.dart';

class QuantityTypeLookupFilterService implements IxListService {
  @override
  BuildContext context;
  @override
  Dio dio;
  @override
  ErrorHandler erHandler;
  @override
  bool isLoading = true;
  @override
  String path = "/api/ware/lookup/quantity_type";

  QuantityTypeLookupFilterService(BuildContext context) {
    this.context = context;
    erHandler = new ErrorHandler(context, PageType.LOOKUP);
    dio = new DioClient().dio;
  }

  @override
  Future<List<QuantityTypeLookupModelDTO>> getData([dto]) async {
    isLoading = true;
    String url = Assets.domain + path;
    if (dto != null) url = url + UrlBuilder.toUrl(dto.toJson());
    Response response = new Response();
    try{
      response = await dio.get(Assets.domain + path);
    }
    catch(e){
      erHandler.dioHandle(e);
    }
    Iterable l = response.data;
    List<QuantityTypeLookupModelDTO> list = List<QuantityTypeLookupModelDTO>.from(
        l.map((model) => QuantityTypeLookupModelDTO.fromJson(model)));
    isLoading = false;
    return list;
  }
}
