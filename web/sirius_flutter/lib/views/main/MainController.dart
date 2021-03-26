import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sirius_flutter/helpers/SharedStorage.dart';
import 'package:sirius_flutter/views/menu/MenuController.dart';
import 'package:sirius_flutter/views/menu/MenuDTO.dart';
import 'package:sirius_flutter/views/menu/MenuService.dart';

import '../../helpers/Util.dart';
import '../error/ServerSideErrorController.dart';
import '../login/LoginController.dart';
import '../user/UserService.dart';

class MainController extends StatefulWidget {
  createState() => _MenuState();
}

class _MenuState extends State<MainController> {
  UserService userService;
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedStorage.getJWT(),
        builder: (context, snapshotJwt) {
          if (snapshotJwt.hasData) {
            userService = new UserService(context);
            return FutureBuilder(
                future: userService.getData(),
                builder: (context, snapshotU) {
                  if (snapshotU.hasData) {
                    Util.user = snapshotU.data;
                    return MenuController();
                  } else if (!snapshotU.hasData && snapshotU.connectionState == ConnectionState.done) {
                    return LoginController();
                  }
                  return Center(child: CircularProgressIndicator());
                });
          } else if (!snapshotJwt.hasData && snapshotJwt.connectionState == ConnectionState.done) {
            return LoginController();
          }
          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator());
        });
  }
}
