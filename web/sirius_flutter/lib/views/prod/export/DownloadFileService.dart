import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sirius_flutter/assets/assets.dart';
import 'package:sirius_flutter/helpers/DioClient.dart';
import 'package:sirius_flutter/helpers/ErrorHandler.dart';
import 'package:sirius_flutter/helpers/IxScaffoldMessenger.dart';

import 'ExportController.dart';
import 'ExportListDTO.dart';

class DownloadFileService {
  BuildContext context;

  Dio dio;

  ErrorHandler erHandler;

  bool isLoading = true;

  DownloadFileService(BuildContext context) {
    this.context = context;
    erHandler = new ErrorHandler(context, PageType.DOWNLOAD);
    dio = new DioClient().dio;
  }

  Future downloadFile(
      String url,
      String savePath,
      Function downloading,
      ExportControllerState state,
      ExportListDTO list,
      int index,
      String fileName) async {
    try {
      Response response = await dio.post(Assets.domain + url,
          onReceiveProgress: (actual, total) {
        downloading(actual, total, state, list, index);
      },
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
          ),
          data: list.filteredList[index]);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      /*file.writeAsBytes(response.data);*/
      state.downloadEnd(fileName, savePath);
    } on DioError catch (e) {
      erHandler.dioHandle(e);
    } catch (e) {
      IxScaffoldMessenger.show(context, e.toString(), type: MsgType.ERROR);
    }
  }
}
