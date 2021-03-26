import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/Util.dart';
import 'package:sirius_flutter/helpers/SharedStorage.dart';
import 'package:sirius_flutter/helpers/UrlBuilder.dart';
import 'package:sirius_flutter/ixFrame/IxList/IxListService.dart';

import 'ProdDTO.dart';
import 'package:http/http.dart' as http;

class ProdServices implements IxListService {
  bool isLoading = true;
  String path = "/api/ware/products";

  @override
  Future<List<dynamic>> getListData([dynamic dto]) async {
    isLoading = true;
    String url = Assets.domain + path;
    if (!dto.isFilterEmpty()) url = url + UrlBuilder.buildUrl(dto.toJson());
    Dio dio = new Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };

    dio.options.headers["authorization"] = Util.tokenJWT;
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      Iterable l = response.data;
      List<ProdDTO> productsList =
      List<ProdDTO>.from(l.map((model) => ProdDTO.fromJson(model)));
      isLoading = false;
      return productsList;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
