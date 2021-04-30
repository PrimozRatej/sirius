import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sirius_flutter/views/error/ServerSideErrorController.dart';
import 'package:sirius_flutter/views/login/LoginController.dart';
import 'package:sirius_flutter/views/main/MainController.dart';

import 'IxScaffoldMessenger.dart';
import 'Util.dart';

class ErrorHandler {
  BuildContext context;
  PageType pageType;

  ErrorHandler(BuildContext context, PageType pageType) {
    this.context = context;
    this.pageType = pageType;
  }

  handle(int httpResStatusCodes) {
    switch (httpResStatusCodes) {
      case 403:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LoginController(),
          ),
          (route) => false,
        );
        break;
      case 200:
        break;
    }
  }

  dioHandle(DioError error) {
    if (pageType == PageType.DEFAULT) {
      if (error.type == DioErrorType.DEFAULT) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ServerSideErrorController(),
          ),
          (route) => false,
        );
      }
      if (error.response.statusCode == 403) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LoginController(),
          ),
          (route) => false,
        );
      }

      if (error.response.statusCode == 404) {
        return;
      }
    }
    if (pageType == PageType.LOGIN) {
      if (error.response.statusCode == 403) {
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Wrong username or password.'),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    }
    if (pageType == PageType.LOOKUP) {
      if (error.response.statusCode == 403) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LoginController(),
          ),
              (route) => false,
        );
      }
    }
    if(pageType == PageType.DOWNLOAD){
      if (error.response.statusCode == 404) {
        IxScaffoldMessenger.show(context, "Such a file does not exist.", type: MsgType.ERROR);
      }

      if (error.response.statusCode == 500) {
        IxScaffoldMessenger.show(context, "Server error", type: MsgType.ERROR);
      }

      if (error.response.statusCode == 403) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LoginController(),
          ),
              (route) => false,
        );
      }
    }
  }
}

enum PageType { LOGIN, SIGN_UP, DEFAULT, LIST_VIEW, OBJECT_VIEW, LOOKUP, DOWNLOAD }
