import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/AppData.dart';
import 'package:sirius_flutter/helpers/UrlBuilder.dart';
import 'package:sirius_flutter/ixFrame/IxObject/IxObjectService.dart';

import 'DashboardDTO.dart';

class DashboardService implements IxObjectService {
  @override
  bool isLoading;
  String path = "/api/ware/dashboard";

  @override
  Future<DashboardDTO> getData(dynamic dto) async {
    String url = Assets.domain + path;
    final response =
        await http.get(url, headers: {"authorization": AppData.tokenJWT});
    if (dto != null && dto.isFilterEmpty())
      url = url + UrlBuilder.buildUrl(dto.toJson());
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return DashboardDTO.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load dashboard');
    }
  }
}
