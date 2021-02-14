import 'dart:convert';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/ixFrame/IxList/IxListService.dart';
import 'package:sirius_flutter/views/ware/helpers/UrlBuilder.dart';

import 'ProdDTO.dart';
import 'package:http/http.dart' as http;

class ProdServices implements IxListService {
  bool isLoading = true;
  String path = "/api/ware/products";

  @override
  Future<List<dynamic>> getListData(dynamic dto) async {
    isLoading = true;
    String url = Assets.domain + path;
    if (!dto.isFilterEmpty()) url = url + UrlBuilder.buildUrl(dto.toJson());
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Iterable l = json.decode(response.body);
      List<ProdDTO> productsList =
          List<ProdDTO>.from(l.map((model) => ProdDTO.fromJson(model)));
      isLoading = false;
      return productsList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load products');
    }
  }
}
