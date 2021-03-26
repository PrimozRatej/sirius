import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/DioClient.dart';
import 'package:sirius_flutter/helpers/Util.dart';
import 'package:sirius_flutter/helpers/ErrorHandler.dart';
import 'package:sirius_flutter/ixFrame/IxObject/IxObjectService.dart';

import '../../helpers/ErrorHandler.dart';
import 'UserDTO.dart';

class UserService implements IxObjectService {
  @override
  bool isLoading;
  @override
  String path = "/api/util/user";
  @override
  BuildContext context;
  @override
  ErrorHandler erHandler;
  @override
  Dio dio;

  UserService(BuildContext context) {
    this.context = context;
    erHandler = new ErrorHandler(context, PageType.DEFAULT);
    dio = new DioClient().dio;
  }

  @override
  Future<UserDTO> getData([dynamic dto]) async {
    Response response = new Response();
    try {
      response = await dio.get(Assets.domain + path);
    } catch (e) {
      erHandler.dioHandle(e);
    }
    return UserDTO.fromJson(response.data);
  }
}
